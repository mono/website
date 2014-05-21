---
layout: obsolete
title: "Release Notes Mono 3.2"
lastmodified: '2014-02-19'
permalink: /old_site/Release_Notes_Mono_3.2/
redirect_from:
  - /Release_Notes_Mono_3.2/
---

Release Notes Mono 3.2
======================

Mono 3.2 is a portable and open source implementation of the .NET framework for Unix, Windows, MacOS and other operating systems.

Mono 3.2 is an update to [Mono 3.0]({{site.github.url}}/old_site/Release_Notes_Mono_3.0 "Release Notes Mono 3.0") based on the master branch of github, it is not a minor upgrade to 3.0. Mono 3.2 was released on July 24th, 2013.

Support for Mono versions 3.0 and 2.10 is been discontinued. No further development of bug fixing is planned for those branches.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#32x-series-release-notes">1 3.2.x Series Release Notes</a></li>
<li><a href="#new-in-mono-328">2 New in Mono 3.2.8</a></li>
<li><a href="#new-in-mono-327">3 New in Mono 3.2.7</a>
<ul>
<li><a href="#highlights">3.1 Highlights</a></li>
<li><a href="#new-features">3.2 New features</a>
<ul>
<li><a href="#runtime">3.2.1 Runtime</a></li>
<li><a href="#class-libraries">3.2.2 Class libraries</a></li>
<li><a href="#tools">3.2.3 Tools</a></li>
</ul></li>
<li><a href="#bug-fixes">3.3 Bug fixes</a></li>
</ul></li>
<li><a href="#new-in-mono-326">4 New in Mono 3.2.6</a></li>
<li><a href="#new-in-mono-325">5 New in Mono 3.2.5</a></li>
<li><a href="#new-in-mono-324">6 New in Mono 3.2.4</a></li>
<li><a href="#new-in-mono-323">7 New in Mono 3.2.3</a>
<ul>
<li><a href="#highlights_2">7.1 Highlights</a></li>
<li><a href="#bugs">7.2 Bugs</a></li>
</ul></li>
<li><a href="#new-in-mono-322">8 New in Mono 3.2.2</a>
<ul>
<li><a href="#highlights_3">8.1 Highlights</a></li>
<li><a href="#bugs_2">8.2 Bugs</a></li>
</ul></li>
<li><a href="#new-in-mono-321">9 New in Mono 3.2.1</a></li>
<li><a href="#new-in-mono-320">10 New in Mono 3.2.0</a></li>
<li><a href="#major-highlights">11 Major Highlights</a>
<ul>
<li><a href="#runtime_2">11.1 Runtime</a></li>
<li><a href="#garbage-collector">11.2 Garbage Collector</a>
<ul>
<li><a href="#low-pause-mode">11.2.1 Low pause mode</a></li>
<li><a href="#low-promotion-nursery">11.2.2 Low promotion nursery</a></li>
</ul></li>
<li><a href="#mostly-precise-stack-scanning">11.3 Mostly precise stack scanning</a></li>
<li><a href="#mobile">11.4 Mobile</a>
<ul>
<li><a href="#size-reduction">11.4.1 Size Reduction</a></li>
</ul></li>
<li><a href="#performance">11.5 Performance</a></li>
<li><a href="#optimizations">11.6 Optimizations</a></li>
<li><a href="#other-platforms">11.7 Other platforms</a></li>
</ul></li>
<li><a href="#installing-mono-32">12 Installing Mono 3.2</a></li>
</ul></td>
</tr>
</tbody>
</table>

3.2.x Series Release Notes
==========================

-   [New in 3.2.8](#new-in-mono-328)

-   [New in 3.2.7](#new-in-mono-327)

-   [New in 3.2.6](#new-in-mono-326)

-   [New in 3.2.5](#new-in-mono-325)

-   [New in 3.2.4](#new-in-mono-324)

-   [New in 3.2.3](#new-in-mono-323)

-   [New in 3.2.2](#new-in-mono-322)

-   [New in 3.2.1](#new-in-mono-321)

-   [New in 3.2.0](#new-in-mono-32)

New in Mono 3.2.8
=================

Mono 3.2.8 is a bug fix only release based on 3.2.7. This is a Linux-focused release.

-   On armhf, VFP scratch registers are now properly preserved across method calls.
-   A potential codegen bug on armhf for methods with lots of arguments has been fixed.
-   We now emit shorter floating point load/store sequences on armhf when possible.
-   Bugs surrounding alignment and mono\_gc\_bzero () / mono\_gc\_memmove () have been fixed.
-   A typo in the BigInteger.Cosh () implementation has been fixed.
-   Tuple\<...\> classes now implement ITuple and have a correct ITuple.ToString () implementation.
-   Bug \#17589 has been fixed.
-   Bug \#17558 has been fixed.
-   A stack alignment change that broke debugging on Android/x86 has been reverted (\#17410).
-   Bug \#17201 has been fixed.
-   The AOT compiler now adds types for method headers for gshared methods.
-   Bug \#17632 has been fixed.
-   The DISABLE\_JIT build has been fixed.
-   Bug \#4510 has been fixed.
-   A potential crash in mono\_method\_desc\_full\_match () has been fixed.
-   Various build system fixes so that make dist works again.

New in Mono 3.2.7
=================

New in 3.2.7

This is a major feature release that accumulates about 5 months of development

Highlights
----------

5 months of work, 1235 commits by 65 contributors.

Initial support for the hardfp ABI on ARM. This enables mono to be used on more recent versions of linux and produce better code on those targets.

The ABCREM optimization received a lot of love, now it works much better on 64bits systems.

Two new optimizations were added, a Loop Invariant Code Motion pass and Alias Analysis are now available. Performance in some functions can improve as much as 20%.

Hardware fences and atomic operations got a large revamp together with support for dynamic feature detection.

64bits CAS instructions are now supported on 32bits systems. This resulted in a significant performance boost on PLINQ workloads with multiple core.

Our LLVM integration got some love. It can now generate fast TLS access, a more recent LLVM version is been used and the list of optimizations we let it perform has been updated.

Our GC received some micro-optimization love by some small optimization in internal data structures and the use of intrinsics to speed up some core loops.

System.Core now has an interpreter for LINQ expressions and dynamic statements that can be used by FullAOT runtimes.

Better support for custom task schedulers.

Significantly improved reachability and flow analysis in C\# compiler.

New features
------------

### Runtime

-   [jit] Fix the handling of OP\_ISUB\_IMM in abcrem.
-   [jit] Improve ABCREM on 64-bits architectures
-   [jit] Implement the delegate ctor optimization in AOT mode too.
-   [jit] Some work towards a win64 port.
-   [jit] Use vectorized exception handling on windows.
-   [jit] Initial support for the hardfp ABI on ARM.
-   [jit] Add beginnings of a mach image writer for use with xdebug.
-   [jit] Implement proper TLS offset translation on mach based kernels.
-   [jit] Add a simple loop invariant loop motion pass for use with LLVM, which moves loop invariant instructions out of loop headers into the preceeding bblock.
-   [jit] Avoid linking the try block with the EH block as this produces spurious BBs during inlining.
-   [jit] The AggressiveInlining hint now triggers class initialization so more stuff gets force-inlined.
-   [jit] Add an alias analysis pass to the JIT.
-   [jit] ARM can dynamically switch between modes.
-   [jit] Atomics and hardware fences revamped and improved.
-   [jit] Add 64bits atomics on 32bits systems , this makes PLINQ significantly faster on multicore systems.
-   [llvm] Implement support for OP\_TLS\_GET\_REG on osx/amd64.
-   [llvm] Update list of optimizations passed to 'opt'.
-   [runtime] Scalability work: reduce usage of the loader lock
-   [runtime] Removed the old debugger from the runtime.
-   [runtime] socket-io: make it possible to specify an interface index as a MulticastInterface SocketOption on linux.
-   [runtime] Don't expand variant generic interfaces on arrays.
-   [runtime] Implemented g\_win32\_getlocale function to return correct locale.
-   [runtime] Revamped hardware caps detection.
-   [runtime] Add LLDB support to mono\_gdb\_render\_native\_backtraces () on POSIX.
-   [runtime] Promote the reference queue API to the public.
-   [runtime] Provide more public API to inspect MonoTypes, MonoClasses and MonoMethodSignatures.
-   [runtime] Improving the retrieval of the user's locale on Apple systems.
-   [runtime] Async stack walking with AOT
-   [sdb] Allow users to specify a suspension policy when enabling an event
-   [sdb] Add async variants to the InvokeMethod methods.
-   [sdb] Support a setpgid=y/n option to --debugger-agent.
-   [sdb] Emit better debugger attribute for stepping over state machine initialization
-   [sgen] Reverse the free-list after sweeping to be in address-order.
-   [sgen] Only enqueue LOS objects if they contain references.
-   [sgen] Use gcc bitcount intrinsics where appropriate.

### Class libraries

-   [corlib] Implementation of System.Reflection.ParameterInfo.HasDefaultValue
-   [corlib] Implemented System.Threading.Monitor.IsEntered
-   [corlib] LogicalSet/GetData implementation in CallContext
-   [corlib] Implement CultureInfo.DefaultThreadCurrentUICulture.
-   [corlib] Implement CultureInfo.DefaultThreadCurrentCulture.
-   [corlib] Add 'System.Runtime.InteropServices.WindowsRuntime.EventRegistrationToken' stub.
-   [Mono.Options] Improve error message for badly bundled args.
-   [pcl] Add new 'System.Runtime.InteropServices.WindowsRuntime' Facade Assembly.
-   [rx] Updated Rx to 2.2 release.
-   [System] Add IsIPv6Teredo to System.Net.IpAddress
-   [System] Add more of System.ComponentModel to MOBILE profile.
-   [System.Core] Update MonoTouch System.Linq.Expression to be 4.5 compatible
-   [System.Core] Add dynamic interpreter
-   [System.Core] Support IReadOnlyList in System.Linq.Enumerable.ElementAt and ElementAtOrDefault
-   [classlib] Introduce the mobile\_static build.
-   [classlib] Add OrderedDictionary to the mobile profile.

### Tools

-   [mcs] Suport recursive references of non-FX assemblies
-   [mcs] Implements definite assignment of expressions
-   [linker] Allow overriding MarkCustomAttribute and expose the MarkDefaultConstructor feature to subclasses
-   [xbuild] Initial MSBuild 12.0 support.
-   [xbuild] Improved xbuild diagnostics.
-   [xbuild] implement "skip target due to previous success" feature.
-   [xbuild] Add xbuild support for BuildManager

Bug fixes
---------

-   [Microsoft.Build.Engine] Fix the escaping/unescaping of FullPath metadata
-   Properly compare assembly versions when performing binding. Fixes \#17368.
-   [sdb] Fix setting of byref variables in registers. Fixes \#17185.
-   [System.Net.Http] Add parsing of multi-value strings. Fixes \#17132
-   [io-layer] Properly check write permission of a file. Fixes \#3501.
-   Don't raise an exception if we can't find the src assembly on a shadow copy appdomain
-   [corlib] Update en-GB first day of week. Fixes \#17151
-   [mcs] Check type of index used in pointer array aritmetic. Fixes \#17145
-   [runtime] Fix large file support on android, it doesn't support -D\_FILE\_OFFSET\_BITS=64, so call lseek64 directly. Fixes \#17128.
-   fix bug \#11335.
-   Fix bug \#11336.
-   [io-layer] Correctly implement permission checking for File.Move. Fixes \#17009.
-   The old check was simply for open sharing status, which is incorrect. The right
-   thing to do is to check for FileShare.Delete and not FileAccess.
-   [jit] Fix some checks in the arm dyn call code. Fixes \#17101.
-   BXC14584 - Console windows pop up during build with mono runtime
-   [PCL]: Add ReadOnlyDictionary type-forwarder for XI. Fixes \#16951.
-   [corlib] Mark all promise-style task exceptions observed. Fixes \#17015
-   [mcs] Emit Debuggable attribute. Fixes \#16924
-   [mcs] Method group caching needs to consider type arguments as well. Fixes \#17059
-   [jit] Save/restore all-callee saved registers in methods using some atomic opcodes on x86, since the opcode implementations use these registers, and the push/pop code used by these opcodes is not async safe, since the unwind code doesn't know about it. Fixes part of \#16808.
-   [runtime] Fix yet another metadata problem with dynamically created types. Fixes \#14977.
-   [jit] Emit calls to class init trampolines for fields accesses inside inline methods in AOT mode. Fixes \#16461.
-   [runtime] Avoid RuntimeHelpers.EnsureSufficientExecutionStack () failing on windows. Works around \#16776.
-   [runtime] Call mono\_class\_setup\_methods () before accessing klass-\>method.count. Fixes \#16883.
-   [corlib] Update datetime patters. Fixes \#17044
-   [mcs] Better check for value type base call. Fixes \#16806
-   [mcs] Await flow analysis uses resolved expression. Fixes \#16840
-   [gsharedvt] Avoid using the variable size code paths for non-variable size types with some array opcodes. Fixes \#17023.
-   [jit] Avoid nullifying class init trampolines for recursive calls to class initializers. Fixes \#16489
-   [WindowsBase] Implement GroupDescription based on moonlight implementation
-   Remove usage of mini\_replace\_type () from mono\_jit\_runtime\_invoke (), runtime invokes care about the precise types of parameters. Fixes \#16830.
-   [aot] Sanitize utf8 characters in symbol names. Fixes \#16851.
-   Fix for PkgConfig cache orphaned entries bug (xam bug \#11133)
-   [mcs] Don't wrap reference type values in explicit nullable conversion. Fixes \#16900
-   [mcs] Restore async modifiers context after nested enums declaration. Fixes \#16997
-   [corlib] Promise style tasks cannot be started manually. Fixes \#16857
-   [corlib] Thread.GetNamedDataSlot allocates slot on failure. Fixes \#16788
-   Use LIFO policy for CancellationTokenSource Fixes \#16992
-   Fix CancellationTokenSourceTest.ReEntrantRegistrationTest
-   Make tuple hash function consistent with the F\# implementation
-   Don't call CFNetworkCopyProxiesForAutoConfigurationScript from more than one thread. Fixes \#7923, comment 21.
-   Check for null item in BindingList\<T\>.InsertItem. Fixes \#16902
-   Do not assume the first certificate of a PKCS12 file is the one matching the key (even if it's the most common way).
-   [System] Change S.N.S.NetworkStream's param name on ctor \#16832
-   [System] When starting a process with UseShellExecute=true, don't return a process. Fixes \#16119
-   [io-layer] On OSX don't pass -W to open as we don't care for it waiting.
-   [runtime] A thread without a domain set cannot be running managed code. Fixes \#16794.
-   [aot] Give the compilation unit entries in the DWARF debug info different names, the osx tools seem to need this (\#15202).
-   [aot] Add runtime wrappers for methods of generic classes and generic methods. Fixes \#16747.
-   [gsharedvt] Add a wrapper to the mono\_gsharedvt\_constrained\_call () icall, since it calls mono\_runtime\_invoke () which can throw exceptions. Fixes \#16439.
-   [jit] Fix TLS+AOT support in the monitor enter/exit trampolines.
-   [jit] Fix memory leaks in get\_gsharedvt\_type (). Fixes \#16787.
-   [corlib] Mark ConcurrentDictionary serializable. Fixes \#16730
-   [bcl] When finalizing a Process object, don't touch the streams as they are finalized on their own. Fixes \#10883.
-   [mcs] Clone labeled statements cache in probing mode. Fixes \#16376
-   [jit]Emit explicit float rounding on amd64. Fixes \#15987
-   [mcs] Update populated member cache of dynamic containers manually for additional entries. Fixes \#16659
-   [mcs] Show correct \#line location for files in other than current location referenced as relative files. Fixes \#16576
-   [system] Redirect of put requests was converted to get. Fixes \#16670
-   [corlib] Multiple fixes to TPL.
-   [Bug 14664] LogicalSet/GetData implementation in CallContext
-   [sgen]Fix a deadlock when the GC try to free a JI during world restart. Fixes \#15759
-   [bcl] Invoke assembly resolve hooks even if the assembly name has a parse error. Fixes \#16487.
-   [corlib] Optimize one string Join\<T\> overload. Fixes \#16647
-   [bcl] Handle BigInt -\> long conversions that should overflow but dont. Fixes \#16526
-   [System.Net.Http] Don't throw on invalid input in TryGetValues. Fixes \#16634
-   [mcs] Don't stop type inference when a unique construction of the generic interface cannot be found. Fixes \#16567
-   [mcs] Add better type conversion to unary mutators. Fixes \#16578
-   [corlib] Implement task awaiters running on custom task scheduler. Fixes \#16587
-   [corlib] Better conversion betwen system locale and CultureInfo. Fixes \#15875
-   [xbuild]: Check a \<Target\>'s "Returns" first, then fall-back to "Outputs".
-   [xbuild]: Allow expressions inside a dynamic \<ItemGroup\>'s metadata. Fixes \#14661.
-   [sgen] Never invoke libc’s memmove() or bzero(). Fixes \#16449
-   [mcs] Report nice error instead of crash for cyclic type forwarders. Fixes \#16385
-   [mcs] Report all failure errors in lambda conversions. Fixes \#16513
-   [xbuild]: Implement task batching for properties; fixes \#16403.
-   [linq] Enumerable.Join and GroupJoin needs to ignore null keys. Fixes \#16530
-   [corlib] DebuggerTypeProxyAttribute.ProxyName needs to return an assembly qualified type name. Fixes \#16527
-   [jit] Implement double-\>uintptr conversions on 64 bit platforms. Fixes \#16529.
-   [sdb] Fix step-over with recursive functions. Fixes \#5700.
-   [corlib] Consider all unicode separators in ToTitleCase. Fixes \#16365
-   [corlib] Set initialized List\<T\> capacity to match input enumeration. Fixes \#16318
-   [mcs] Report ambiguity in attribute types in expanded mode. Fixes \#16342
-   [mcs] Emit this initializer for structs. Fixes \#16430
-   [sgen] Implement our own qsort() so as not do deadlock. \#16432
-   [mcs] Dynamically calculate size of flow-analysis bitset. Fixes \#4210
-   [Bug 16334] Fix ConcurrentBag.TryTake and TryPeek
-   [Bug 16267] SemaphoreSlim.Wait fix when no timeout
-   [runtime] Avoid caching member\_ref tokens of dynamic images. Fixes \#16096
-   Fix the \`nop\` opcode on some MIPS-based Loongson CPUs. [https://sourceware.org/ml/binutils/2009-11/msg00387.html](https://sourceware.org/ml/binutils/2009-11/msg00387.html)
-   [Bug 16186] SqlCommand.BeginExecuteInternal fix
-   [sdb] Add an ExitCode property to VMDeathEvent. Fixes \#16113.
-   [aot] Increase a buffer size to avoid an assert. Fixes \#16239.
-   [runtime]Type parsing of generics should not rely on the presence of a backtick. Fixes \#15124.
-   [mcs] Assignment to value type readonly generated variables needs to check all member access expressions. Fixes \#15832
-   [mcs] Missing type forwarded types should not cause type collision. Fixes \#16196
-   [linker] Do not import something that is not marked when sweeping type references (otherwise we might re-intoduce dependencies we're not including or need) [\#16213]
-   Always show error message when type resolver produces ambiguous type. Fixes \#16115
-   Setting ReceiveBufferSize & SendBufferSize on Socket (Bug 16021 & Bug 12754)
-   [sle] Enable char equality comparison. Fixes \#15582
-   Update currency separators. Fixes \#15425
-   Extract CurrencyDecimalDigits using currency and not territory info. Fixes \#15895
-   [jit] Use unsigned comparisons with the IMT thunks as they can live in high memory addresses.
-   Task.WhenAllCore\<T\> now handles empty argument list correctly. Fixes \#15956
-   TimeZone.GetUtcOffset should use Standard UTC offsets for the period when daylight savings ends.
-   [runtime] Preserve the call chain in mono\_arch\_setup\_async\_callback () on amd64 to prevent crashes in the libgcc unwinder (\#15969).
-   Return empty result array when calling Task.WhenAllCore\<T\> with empty argument list. Fixes \#15956
-   [runtime] Fix stack size detection on osx mavericks. Fixes \#15890.
-   [runtime]Split thread unregistration in two steps, one with no locks, one with locks taken. Fixes \#15916.
-   [runtime] Handle unaligned access in all interlocked icalls. Fixes \#15925.
-   [sdb] Implement support for DebuggerStepThrough attribute. Fixes \#15139.
-   [System] Avoid an NRE when Close() and Write() are concurrent. \#15857
-   [sdb] Fix an assertion if a single step breakpoint is hit in a thread other than the thread the single stepping is done on. Fixes \#14950.
-   [Mono.Debugger.Soft] Implemented inheritance for TypeMirror.GetCustomAttributes() Fixes bug \#15320
-   [runtime] Fix an assertion in mono\_arch\_context\_get\_int\_reg () on amd64. Fixes \#15786.
-   When parsing documentation cref text turn on error probing for tokenizer as well. Fixes \#15511
-   Better error message when member does not implement interface. Fixes \#15369
-   Variables from diffent parameter block still need to be captures even if async block has no await. Fixes \#15719
-   The stripper does not care if some variables can't be referenced (they'll be removed) and new cecil has a similar fix [\#15727]
-   Update lower/upper type inference fixing to match the latest C\# standard. Fixes \#15505
-   Enum subtraction quirk needs to work with numeric constants only. Fixes \#15520
-   When looking for base implementation of generic MVAR methods use non-inflated parameter types. Fixes \#15523
-   [sdb] Add an IncludeSubclasses property to ExceptionEventRequest, to control whenever to include subclasses of the exception type. Fixes \#15541
-   Fix condition (for MOBILE) that excluded System.Xml.Schema/Extensions.cs. Removed the condition since every profile we now support includes this [\#15552]
-   Fill out AssemblyName.ProcessorArchitecture for assemblies. Fixes \#15347.
-   Better check for open generic types in probing expression. Fixes \#15422
-   Fixes too early optimization of binary &&/& bool constants. Fixes part of \#15392
-   [sgen] Don't crash on nurseries of 512M or larger.
-   [aot] Only use an AOT shortcut in the trampoline code if its safe to do so. Fixes \#15345.
-   [xdebug] Avoid using a MonoDebugMethodJitInfo structure after it has been freed. Fixes \#15090.
-   bxc\#13642: MacNetworkChange: implement using managed code
-   Compound assignment of optimized binary constant needs to decompose it first. Fixes \#15315
-   Ensure that CodeDom generated temporary directory is always created. Fixes \#12202
-   Process/compare/output method's generic parameters [\#15311]
-   Enum IConvertible can convert to same enum or System.Enum. Fixes \#15289
-   Release continuation ancestor before running. Fixes \#15036
-   Adds async type inference of void return type. Fixes \#15238
-   Make Task.Delay more reliable. Fixes \#14585
-   Fallback to \$LANG if \$LC\_ALL isn't set. 15214
-   Cache only resolved types not expression to report correct error location. Fixes \#15035
-   Better check for instance equality of generic types. Fixes \#15100
-   Support deserializing relative Uris. Fixes \#15169.
-   Relax name check when deserializing a WindowsIdentity instance as the name can be empty (e.g. iOS7 simulator will hide the user name) [\#12789]
-   Anonymous method with this access inside an iterator needs to initialize captured this field from iterator's copy. Fixes \#14926
-   [sdb] Fix decoding of nested structs. Fixes \#14942.
-   there was another escape sequence 1B 24 40 to indicate "old" JIS. Fix bug \#14951
-   Don't crash when reporting invalid named argument name. Fixes \#14962
-   [MSBuild] Fix the \${level} and \${number} capture. Fixes: [https://bugzilla.xamarin.com/show\_bug.cgi?id=14767](https://bugzilla.xamarin.com/show_bug.cgi?id=14767)
-   Better checks for inaccessible member used via dynamic proxy. Fixes \#14762
-   Initialize cookie container for default requests. Fixes \#14783
-   Check modifying members of readonly value-type field. Fixes \#14802
-   Make sure we properly account for transitive liveness when processing bridge objects. Fixes \#13858
-   Implements content loading cancellation. Fixes \#13200
-   Fixed TaskFactory::ContinueWhenAny with func result. Fixes \#14839
-   [sgen] Use \_\_builtin\_ctzl () in OBJ\_BITMAP\_FOREACH\_PTR () on 64 bit platforms. Fixes \#14834.
-   AggregateException::GetBaseException uses only 1-based inner exceptions. Fixes \#14824
-   [FIX] Bug 267: wsdl fails with "Argument is out of range."
-   [System.Web] Do not crash on duplicate keys in browser capabilities \#14720 \#13014
-   [System.Net] Fix CFNetworkCopyProxiesForAutoConfigurationScript signature. Fixes \#7923.
-   [runtime] Fix a bug in the local register allocator when an fp vreg wasn't clobbered by a call if its href happened to be equal to the hreg of the call instruction. Fixes \#12510.
-   Fix: bug [https://bugzilla.xamarin.com/show\_bug.cgi?id=14811](https://bugzilla.xamarin.com/show_bug.cgi?id=14811) (to be reviewed)
-   [sdb] Add an implicit seq point after every nonvoid call and make step over skip them. Fixes \#10782.
-   [runtime] Make mono\_install\_handler\_block\_guard () async-safe. Fixes \#14073.
-   Don't crash when unreachable code contains unreachable constant switch. Fixes \#14587
-   Unify Array/List FindIndex/FindLastIndex handling and argument checking. Fixes \#14632
-   [bcl] Fix BlockingCollection.TakeFromAny to handle when no items are available on the first collection. Fixes \#6095.
-   Fix Bug 4811, xbuild should find xml documentation
-   [jit] Make ABCREM really remove bounds checks, not just when running with -v -v -v -v.
-   [llvm] Use i64\*/i32\* as the LLVM type of objrefs instead of i64/i32, the basicaa LLVM pass cannot see through the inttoptr casts we were emitting before loads.
-   [llvm] Make some types more precise to decrease the number of int\<-\>ptr conversions generated.

New in Mono 3.2.6
=================

Mono 3.2.6 is ahotfix release.

Bug fixes.

-   Add System.Runtime.InteropServices.WindowsRuntime APIs and PCL Facade
-   Fix problem in MSBuild handling of "Returns" in \<Target\>. This affects multiple Microsoft.Bcl.Build NuGet packages
-   Implement task batching in MSBuild. Fixes BXC \#16403
-   Add /Libraries to llvm search path on OSX, this makes --llvm work in more cases

New in Mono 3.2.5
=================

Mono 3.2.5 is a hotfix release.

Bug fixes:

-   Miscompilation of PCL projects referencing System.Net.Http
-   Improper stack size detection on Mavericks lead F\# and C\# compilers to crash.
-   Includes the latest F\# release, 3.0.31.

New in Mono 3.2.4
=================

This is a bug fixing only release.

Fix some packaging issues.

Fix System.IO.Compression.CompressionLevel enum.

Include namespace-level summary and remarks elements [\#14672]

Multiple fixes to the PCL Facade assemblies.

New in Mono 3.2.3
=================

Highlights
----------

This release features over 2 months of fixes a few nice features.

We're now back to do simultaneous releases to Windows, Linux and Mac.

The C\# compiler has a lot of fixes for async related issues.

New static and dynamic hardware capabilities probing, mono can now exploit hardware caps in many more cases than before.

Blended v5/v7 mode for arm. Some ARM targets require binaries that support all the way from very old CPUs to the most modern ones. Previously we would fail to work on SMP machines when built for UP targets.

Added skeletons for both System.DirectoryServices and System.Windows.Forms.DataVisualization.Charting.

New server focused flag. Run mono with --server to tell the runtime to target performance. With this release, this means an aggressive threadpool scheduler that creates additional threads faster.

We put a lot of effort on windows for this release. Builds are now based on a recent mingw toolchain. We fixes a good number of build issues and bugs in the windows backed.

We have finally switched to use vectored exception handling on windows, which makes it possible, for those of us that like Inception, to debug mono's debugger.

And, finally, PCL has arrived. This means a few fixes in the runtime, class libraries and build tools. And, on Mac, we now ship PCL reference assemblies.

Bugs
----

-   1782 - Check generic constraints for duplicates.
-   4141 - XmlSchemaImporter needs to consider attributeGroupRef in some case.
-   4344 - xsl:stylesheet always ignored xsl template contents.
-   4668 - C\# compiler doesn't like decimal in custom attribute values, so use string.
-   6327 - Correctly install xbuild
-   7126 - Don't allow execution of dynamic assemblies without run access.
-   8637 - omit xml declaration for ToString().
-   8719 - Implements parsing of multi value User-Agent string.
-   8934 - Add more implicit generic array interfaces.
-   10001 - Do not use chunked encoding with CGI/FastCGI.
-   10194 - SetElementValue(nonExistentElementName, null) caused NRE.
-   11294 - Add more system assemblies remapping.
-   11778 - Fix Syscall.readlink() for non-ascii targets.
-   11910 - Implement character validation methods in XmlConvert.
-   12035 - xsi:nil='true' was ignored in some scenario.
-   12469 - Add more conversion methods to XmlAtomicValue.
-   12995 - Avoid an assert in mono\_save\_seq\_point\_info () if no seq points are generated for a method.
-   13050 - Properly null terminate strings in mono\_dwarf\_escape\_path ().
-   13065 - Continue single stepping if the same line reached in all cases. Factor out some code code.
-   13191 - Avoid passing partially shared instances to the JIT.
-   13233 - Fix an overflow if MONO\_ZERO\_LEN\_ARRAY is not 0.
-   13289 - Nested partial type inside generic class can have base type defined later than current type inflation happens.
-   13316 - Add nested partial types inside nested partial types to AST.
-   13318 - Schedule internal delay task on default scheduler only.
-   13324 - Lazy initialization of type parameters expanded interfaces.
-   13336 - Handle property with default values.
-   13340 - Another attempt at fixing mono\_atomic\_load\_acquire() on MSVC.
-   13343 - Support FTP download where PWD starts with '\\'.
-   13362 - Adds async handling to binary:emitbranchable.
-   13435 - Add some error checking to custom attr parsing and plug a memory leak.
-   13443 - Add clone for error expression.
-   13454 - Lift result of enum substraction when operation is lifted due to non-nullable enum type.
-   13466 - Add \*CachePolicy to mobile profile.
-   13476 - Ignore space separators in nowarn arguments.
-   13488 - Add AssemblyAction.Save to the linker.
-   13497 - Check promoted value type binary equality operations against null too.
-   13501 - Correctly parse pragma headers.
-   13509 - Remove CultureInfo.CurrentCulture dependency from ordinal based string::EndsWith.
-   13523 - Write only import section from global namespaces before global attribute sections.
-   13544 - Fix overflow checking in newarray with 64 bit array lengths.
-   13549 - Correctly import nested non-generic types inside generic containers used within same generic container.
-   13552 - Grow underlying buffer only when necessary.
-   13603 - Quote path arguments to opt/llc.
-   13604 - STW handshake/thread shutdown race condition.
-   13626 - Rewrites RuntimeReflectionExtensions to actually do something.
-   13682 - Don't show internal error when default paramater expression cannot be converted to paramter type.
-   13708 - ASP.NET routing constraints should be treated as 'convertible to string'
-   13716 - use XmlSchemaSettings.XmlResolver to resolve schemas.
-   13729 - Fix cross compilation to windows. "Windows.h" should be "windows.h".
-   13731 - Handle partial class case when nested type of partial container depends on parent base type from another partial container.
-   13734 - Disable LLVM for async methods.
-   13736 - Create correct flow branching for single non-default switch section.
-   13742 - Always release DeflateStream unmanaged resources.
-   13767 - Handle custom attributes with nested array of enums.
-   13786 - Update named params parameter converted result expression.
-   13793 - Inflate default parameter expression without type checks
-   13813 - Thread teardown race condition.
-   13817 - Basic optional parameters support in binder.
-   13879 - Verifier support for IReadOnlyList\<T\> and IReadOnlyCollection\<T\>.
-   13890 - Relax the restriction on global methods visibility.
-   13892 - Add argument modifiers to generated base proxy when needed.
-   13951 - Avoid lookups in the AOT images during STW.
-   13952 - Don't crash when reporting invalid case label value.
-   13953 - Support OID names in RSACryptoServiceProvider.SignData().
-   13969 - Fix recursive check for non dependent return types during type inference.
-   13970 - Correct parsing of invalid 00000000-0000-0000-0000-000000000000 guid format.
-   13977 - Use the invariant culture calendar if the requested one is not available.
-   13996 - Type parameter inflated interfaces needs to be marked too.
-   14032 - Fixes GZipStream dispose order.
-   14053 - Report error for name collision between property and generic method.
-   14069 - Avoid the managed-\>copy for ref vtypes with an [In] attribute in n2m wrappers.
-   14077 - HashSet no longer grows in capacity on deserialize
-   14126 - Bad compiler interaction between anonymous method and async
-   14143 - xsl:import in included stylesheet caused compilation error.
-   14168 - Use IReflectType interface instead of TypeDelegator.
-   14185 - Fixes negative symbol definition for few locales to be simple -.
-   14194 - Fix yet another DISABLE\_JIT bug in wrapper generation.
-   14217 - Fix an LLVM assertion on structs with unaligned size.
-   14245 - Invalid syntax during attribute target parsing can crash parser.
-   14289 - Probing of generic parameter needs to check both operands.
-   14339 - Clear out the ref fields from MonoDomain before calling mono\_gc\_clear\_domain.
-   14347 - More thorough check for managed type parameters.
-   14351 - Bad compiler interaction between captured this, lambdas and async.
-   14384 - Don't resolve extension method expression when in probing mode.
-   14426 - Perform alignment checks for CAS on 32bits systems.
-   14503 - Add support for invoking interface methods.
-   14505 - Set empty string to TraceListeners for empty assert message.
-   14515 - Fixes parallel enumerable index counter.
-   14544 - Add System.ServiceModel.Activation assembly.
-   14555 - Make suspend work during thread cleanup.

New in Mono 3.2.2
=================

Highlights
----------

This is a bugfix release.

Some edge cases in our garbage collector that were found in internal testing are now fixed. Multiple C\# compiler issues fixed.

Bugs
----

-   TPL- Fix scheduling of non-inlined synchronous continuations.
-   Weaken a race condition in object initialization
-   Fix race conditions in finalizer/weak link staging
-   Fixed System.Text.Decoder.GetChars(byte\*,int,char\*,int,bool) to copy output into the char\* buffer
-   Fixed configure.in to fail the \_\_thread check with clang
-   Fixed g\_utf8\_to\_utf16\_general() to handle invalid utf8
-   8934 Add more implicit generic array interfaces.
-   13050 Properly null terminate strings in mono\_dwarf\_escape\_path ().
-   13191 Avoid passing partially shared instances to the JIT.
-   13362 Adds async handling to binary:emitbranchable.
-   13443 Add clone for error expression.
-   13454 Lift result of enum substraction when operation is lifted due to non-nullable enum type.
-   13466 Add \*CachePolicy to mobile profile.
-   13476 Ignore space separators in nowarn arguments.
-   13497 Check promoted value type binary equality operations against null too.
-   13509 Remove CultureInfo.CurrentCulture dependency from ordinal based string::EndsWith.
-   13603 Quote path arguments to opt/llc.
-   13604 STW handshake/thread shutdown race condition.
-   13734 Disable LLVM for async methods to work around.
-   13951 Register the jit info for GC critical methods as soon as they are loaded
-   13952 Don't crash when reporting invalid case label value.

New in Mono 3.2.1
=================

Mono 3.2.1 is a hot-fix release.

It fixes [bug 13509](https://bugzilla.xamarin.com/show_bug.cgi?id=13509), which causes a crash when the current culture is set to zh\_TW.

New in Mono 3.2.0
=================

Major Highlights
================

Runtime
-------

LLVM updated to version 3.2, this brings better optimizations for mono.

Garbage Collector
-----------------

Mono now defaults to the SGen Garbage Collector.

A lot of work went into making this the best performing and most stable release of our collector.

As part of making it broadly usable, two problematic workloads were addressed and make much faster.

One is the popular object workload, where a few pinned nursery objects are very popular with old generation objects, causing a lot of remembered sets to be created. To avoid that, popular objects are made immortal until the next major collection.

The other is the massive thread stacks workload, where a lot of threads with big stacks need to be conservatively scanned. This used to put a lot of pressure on the pinning stage since it would produce very big pin queues. To avoid that, we employ hash filtering on pin queues and that dramatically reduce their average size and we pin major blocks instead of individual objects.

In addition to that, we switched to lazy sweeping by default, which reduces major collection pause times and improves aggregate throughput.

Three new experimental modes for the garbage collection are now available.

### Low pause mode

Under the low pause mode, SGen will execute major collections concurrently to your application and only briefly pause to finish it. To enable it pass major=marksweep-conc in the MONO\_GC\_PARAM environment variable.

### Low promotion nursery

The low promotion nursery employs aging to reduce temporal effects on object promotion and reduce the pressure on the major heap. To enable it pass minor=split in the MONO\_GC\_PARAM environment variable.

Mostly precise stack scanning
-----------------------------

Now it's possible to enable mostly precise stack scanning, that can speed up collections by reducing the volume of conservative scanning needed. This reduces pinning, leading to shorter minor collection pause times and increased space usage of the nursery.

Mobile
------

Mono 3.2 Basic Class Libraries now can fully build Xamarin's mobile profile.

### Size Reduction

Multiple features can now be disabled for the classlibs to reduce the footprint on mobile devices. FullAOT targets now enjoy much better fallbacks and much more linker friendly code.

Performance
-----------

The FullAOT compiler can now generate much faster code for icalls and has support for generic valuetype sharing, ending issues with missing methods at runtime once and for all.

Optimizations
-------------

Performance of primitive parsing was greatly enhanced.

LINQ is now much faster with arrays.

Large object cloning and boxing is up to two times faster.

Optimize Marshal.Read/Write methods to avoid a trip to unmanaged when possible.

Other platforms
---------------

Google contributed ports of NaCl for ARM and Amd64. SGen now works on FreeBSD.

Installing Mono 3.2
===================

**Binary Packages and Source Code Downloads:**

    Source code and pre-compiled packages for Linux, Solaris, 
    MacOS X and Windows are available from our web site from 
    the Downloads section.

**Quick source code installation:**

    If we have no packages for your platform, installing from 
    source code is very simple.   

Compile libgdiplus to support System.Drawing:

``` bash
    $ tar xjvf libgdiplus-3.0.tar.bz2
    $ cd libgdiplus-3.0
    $ ./configure
    $ make
    $ make install
```

Then compile Mono itself:

``` bash
    $ tar xjvf mono-3.2.0.tar.bz2
    $ cd mono-3.2.0
    $ ./configure
    $ make
    $ make install
```

