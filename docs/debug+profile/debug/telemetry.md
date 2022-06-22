---
title: Telemetry
redirect_from:
  - /CrashReporting/
  - /Telemetry/
---

Use Cases
----------------------------

Getting users to report bugs and crashes is a difficult problem.

It's important to keep the barrier to entry low,
while still ensuring that bug filers are providing actionable information. Often a filer does not provide enough information,
requiring many messages be sent back and forth before the developer can begin working on the bug. Users often lose interest
a few days or weeks after filing the bug, leaving only an ambiguous description of bug reproduction and no stack traces, logs,
or executable reproductions. Often many users report the same bug in the same incomplete way. Other crashes are hidden
due to automatic recovery, and are never reported.

What if that initial exchange could be so simple and information-rich that bugs could be filed in an automatic manner?
What if two identical crashes could be automatically deduplicated? What if you could identify platform attributes
that seem to accompany bugs using statistics, rather than relying on bug reporters to describe it?

Such telemetry systems are very attractive for clear reasons, but they are often tied to a single project or a single company.
They're often custom-made solutions that can't be reused by the community. Heavyweight bug collection and always-on reporting
that sends enormous amounts of data back to this single source is not only inconvenient. In the modern world, it can be illegal.
Legislation like the GDPR increasingly regulates what can be sent.

Mono has therefore created a reusable, privacy-preserving crash reporting system. For faults that are due to unmanaged exceptions,
the system will work out of the box. For managed unhandled exceptions, it takes just a bit of configuration. By opting to use this
system to report all managed and native parts of their application, someone shipping code using Mono can leverage this crash reporting
infrastructure.

Whether you're shipping a commercial C# application on OSX, embedding Mono into your application, or running a C#-heavy linux desktop suite,
this crash reporting system aspires to have something to offer to you.

Normal Crash Reporting
----------------------------

We have a lot of options described in future sections, but it's worth remembering that the critical path of this code
is in response to Mono crashing. This works by default, nothing needs to be enabled to get a crash file when Mono
has an unmanaged crash occur.
(Note that crash reporting is not enabled for all platforms. Windows and mobile are excluded, for instance.)

When that happens, the OS has sent Mono a native signal indicating a failed assertion,
memory protection fault, or other illegal operation.  When the runtime receives this signal, it
will perform a global Crash Reporting runtime state dump.

A global state dump that has been triggered by an unmanaged crash does the following steps:

1. Allocate and/or clear memory for the output to occupy
2. Aggressively halt all other native threads attached to Mono
3. Walk the stack of each thread, recording frames
4. Collect other runtime state, such as the amount of allocated memory
5. Create output crash dump, a versioned blob of JSON in our particular layout
6. Allow other threads to resume and undo environment created in step 2
7. Write crash string to disk or send to registered handler application

This allocates memory for the crash file, aggressively halts every other native thread associated with
Mono, and walks their stack. Before allowing these other threads to resume, the dumper creates a blob of
versioned JSON in a specialized runtime format. This blob is written to disk with a filename that includes
a hash of the stacktrace.

Privacy and the GDPR
--------------------

It's vital in the modern era to not violate users' trust whenever their data comes into your possession.
The GDPR has a strict definition of what constitutes private or identifying information. Our dump format is
specially designed to only collect information that we know is alright to collect.

We are careful to never include the data from the running program in the application, only references to
information in the program itself. For instance, we describe the program version, amount of memory in use,
and the stack traces for every running mono thread.

These stack traces describe foreign keys that can be used to determine which function is at which position
in the frame. If a user's program happens to have frames above ours (let's say they're using our library),
then we won't have the information required to turn the primary keys in their code into names to methods and
classes. This separation of symbolification preserves privacy.

This ensures that users know they can feel comfortable distributing crash files without worrying that
their secrets will be exposed.

ICalls For Crash Reporting
--------------------------

### Producing Crash Files

There are a few ways to get a telemetry-ready file without having to kill the runtime:

All of the below ICalls produce a Tuple containing a string, a ulong, and another ulong.

The string contains the textual content of the runtime dump that was collected. It is a versioned
blob of JSON that fits our particular runtime format. We describe in a section later in this document
how to work with stacktrace frames from this format.

We also have two ulongs which are crash hashes. These are made
by hashing attributes of the managed stack of the thread that triggered the dump.
The first one returned is a "portable hash" that does not contain method offsets or
other things that are highly likely to change between versions of an application. The
second one is an "unportable hash" that contains these attributes.

These hashes can be used
to deduplicate stacktraces. It's recommended not to simply discard duplicates, as there are
logged details of the application context that may be useful for isolating things required to reproduce a crash.

Our Crash Reporting support is behind a number of private, reflection-only methods from the
Mono.Runtime namespace.

You will want to use an invocation resembling the below example to make an ICall:

```csharp
var monoType = Type.GetType ("Mono.Runtime", false);
var send = monoType.GetMethod(iCallName, BindingFlags.NonPublic | BindingFlags.Static);
var send_params = new object[] {exc};
send.Invoke(null, send_params);
```

The variable above called "iCallName" should be replaced with the name of one of the ICalls mentioned
below.

### DumpStateTotal

```csharp
static Tuple<String, ulong, ulong> DumpStateTotal ()
```

The first one here dumps the entire runtime. It has to stop other threads, and so
relies on the thread halting machinery used during unmanaged crashes that we described above.

This thread suspension machinery relies on OS signals, which can on rare occasions interfere
with correct functioning of native threads associated with the crashing runtime.
This is not to say that this ICall is dangerous for most applications. This ICall is tested under
situations where there are many concurrent global dump requests being made at once.
Nevertheless, there remains a risk that native code which is low level enough will be able
to observe an unexpected signal. Internal bugs can be exposed by unexpected platform quirks.

The thread cooperation has an observable performance cost. Noticeably, it will render all threads
unresponsive for a short, limited duration. It is not appropriate to use this ICall in a context
where one expects it to be called many times per second.

### DumpStateSingle

```csharp
static Tuple<String, ulong, ulong> DumpStateSingle ()
```

This ICall will only get the stack of the calling thread. It will be much faster, and doesn't
carry with it the risks of running code in a signal handler context. If you are aware that only one
thread needs to be dumped, consider using this one instead.

### ExceptionToState

```csharp
static Tuple<String, ulong, ulong> ExceptionToState (Exception exc)
```

The last option requires no stack walking. When a runtime has a managed exception that it would like to
send to telemetry, it can convert it into a dump file.

### Native Crash Reporting Senders

```csharp
static void SendMicrosoftTelemetry (string payload_str, ulong portable_hash, ulong unportable_hash)

static void WriteStateToFile (Exception exc)
```

The above are two examples of telemetry serializers or senders you'll find if you examine Mono.Runtime.

The first one is attached to native Mono code that interfaces with an uploader internal to MS. It's
not relevant to anybody else, and does not work by itself.

The second one is likely to be useful to
someone in the community. It stores the managed exception as a text file on the filesystem, with a name that
encodes the hash. This is a convenient way to serialize unhandled managed exceptions. It will use `ExceptionToState`
to produce a crash dump to write to a file. We write the file to the working directory with a specially-formatted name.

```csharp
AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(HandleException);

public static void HandleException (object sender, UnhandledExceptionEventArgs e)
{
    var exc = e.ExceptionObject as Exception;

    var monoType = Type.GetType ("Mono.Runtime", false);
    var send = monoType.GetMethod("WriteStateToFile", BindingFlags.NonPublic | BindingFlags.Static);
    var send_params = new object[] {exc};
    send.Invoke(null, send_params);
}
```

### Configuration

```csharp
static void RegisterReportingForNativeLib (string modulePathSuffix_str, string moduleName_str)
```

When working with native libraries other than Mono that one wants crash reporting for, it's important to
correctly register the library. The first argument to this ICall is some unique suffix of the path to the
native library in question. This is a platform-dependent and application-dependent string.

This is being compared against the value returned from dladdr for the file path. It's recommended to double
check that the string returned from dladdr matches what's expected.

Mono gets symbols by default. Any frames that point to functions in other native libraries will not appear in a dump
by default. There will just be a placeholder message that the frame had an unregistered method. Upon registering the
native library, the frame will be reported to have the relevant module, function address, and offset.

Crash Reporting Via Debugger
----------------------------

### Interactively

When attached with a debugger, VM termination results in a disconnect. There are many reasons why this can happen, each of
which is explained differently by the debugger client. When the VM disconnects because it has an unhandled native exception,
a CrashEvent is sent to the debugger client. It will display that the cause of VM termination is due to a crash. It may display
the crash JSON directly, to enable easy bug filing.

Copying and pasting the text and the hash enables someone to query a database of existing crashes and to see if this hash
has been seen before. Knowing that one just reproduced a specific bug can be very useful for a developer.

### Programmatically

After reading an event from the queue after a disconnect, one gets a VMDisconnectedException. If this disconnect
is due to a VM crash, the last event in the queue should be a CrashEvent. This CrashEvent object has the fields Dump and Hash.
The "Dump" field contains the JSON file, and the "Hash" field contains the portable hash (see above).

For more information about this API, see the docs for the [Soft Debugger Protocol](https://www.mono-project.com/docs/advanced/runtime/docs/soft-debugger-wire-format/).

Symbolication and Aggregation
----------------------------

### Native Stack Frames

After having registered a library with `RegisterReportingForNativeLib`, it's rather straightforward to turn a
frame from the dump file info a function name and offset.

A function pointer at runtime is highly non-portable. Due to ASLR, native libraries are
laid out in a non-predictable order. Therefore we work only with offsets into these native libraries.
When symbolicating, you must first look at this `native_module` name and match it up to the native library
in question.
We split the address into two parts: the offset of the function in the native library (`native_address`),
and the offset of the instruction in the function (`native_offset`).

Examine the below sample frame from the crash file:

```json
      {
        "native_address" : "0x1003a6340",
        "native_offset" : "0x00046",
        "native_module" : "mono"
      }
```

We can search for the address of the function offset in the output of any symbolication tool
when applied to the native library.

 ```bash
$ nm mini/mono-sgen | grep '1003a6340'

00000001003a6340 t _mono_runtime_run_main_checked

```

If it's inconvenient to have to have the binary in question on hand for symbolication, one can
precompute a small database. The data can be found using the below command. Grepping for function addresses
through the output of this command is also a valid way to symbolicate in a non-automated manner.

```bash
$ nm mini/mono-sgen | grep ' t ' | sort -n

00000001000a4e90 t _alloc_ireg
00000001000a4eb0 t _decompose_long_opcode
00000001000aae90 t _mono_decompose_long_opts
00000001000aaea0 t _mono_decompose_vtype_opts
00000001000ae130 t _m_class_get_byval_arg
00000001000ae150 t _alloc_dreg
............
```

Mapping each native offset into each native function to source file and line number is left to the developer. Most interactive debuggers will
provide that information. The gdb command `p/a $native_address + $native_offset` works here.

### Managed Stack Frames

The crash format gives a managed frame a GUID to their assembly, a token to the method, and an IL offset. From there, a line number in a source file can be retrieved by the symbolicator using Mono.Cecil.

### Uploader Examples (Sentry)

For the purpose of reporting on failures on our testing cluster, we have created an integration with the popular, open-source framework [Sentry](https://sentry.io/).
It works by reading the files created by `WriteStateToFile`. For embedders wishing to use the crash reporter with Sentry, or looking for executable examples of up-to-date crash file serialization, please follow the tool added in [mcs/tools/upload-to-sentry/](https://github.com/mono/mono/tree/master/mcs/tools/upload-to-sentry).
