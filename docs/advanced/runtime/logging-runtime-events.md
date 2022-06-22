---
title: Logging Runtime Events
redirect_from:
  - /Logging_Runtime_Events/
---

The event logging functionality in Mono displays information on runtime operations such as loading libraries, and configuration files. Logging is useful for debugging applications and trouble shooting installation issues. When logging is enabled extra debug info is printed to both stdout and stderr while an application is running.

## Trace levels

The Mono runtime will output different amounts of information based on the log level. The log level is set by the MONO_LOG_LEVEL environment variable. Modifying this variable after startup will not change the log level. It should always be set before running the application. Possible values for the logging level are "error", "critical", "warning", "message", "info", and "debug". All messages with a higher level then the current value will be displayed. So setting the log level to "warning" will display all "warning", "critical", and "error" messages. Setting the log level to "debug" will display all messages. The default log level is "error".

## Trace Filters

There are a number of different types of trace information the runtime can display. To filter the data so it can be interpreted more easily the MONO_LOG_MASK environment variable should be used. The mask should be set before the application is run and can not be altered while the application is running. Setting the mask will enable logging for only certain runtime functions. Possible values for the log mask are:

-   "all" - Display all messages regardless of type
-   "aot" - the Ahead Of Time precompiler
-   "asm" - The assembly loader
-   "cfg" - The configuration file loader
-   "dll" - The native library (pinvoke) loader
-   "gc" - Garbage collector information
-   "io-layer" - I/O layer: processes, files, sockets, events, semaphores, mutexes and handles. I/O layers subsystems can be selected with the following categories instead of "io-layer":
    -   "io-layer-process", "io-layer-file", "io-layer-socket", "io-layer-event", "io-layer-semaphore", "io-layer-mutex", "io-layer-handle"
-   "io-selector" - async socket operations
-   "security" - e.g. Moonlight CoreCLR support
-   "threadpool" - thread pool generic
-   "type" - Type load information

The MONO_LOG_MASK can be set to one or more values. Values are separated by a comma. To display only messages for native library loading and config file loading the log mask would look like this: MONO_LOG_MASK="dll,cfg".

The default log mask is "all". If the mask is not set by the user all message types will be displayed.
