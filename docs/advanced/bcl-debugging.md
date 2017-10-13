
# Debugging Mono Base Class Library

## Using Visual Studio on Mac

1. [Compile](/docs/compiling-mono/mac) and install your own Mono version into specific prefix. For purpose of this 
guide, we are going to use `/home/marek/mono`. For even better debugging experience you could configure 
your Mono with `--disable-bcl-opt` options.

2. Launch Visual Studio for Mac

3. Go to `Visual Studio -> Preferences` and add your prefix path where you installed your locally built Mono.

![.NET Runtimes](/images/bcl-debug-1.png)

4. In same dialog also untick `Debug project code only` checkbox and close the window.

![Debugger settings](/images/bcl-debug-2.png)

5. Go to menu `Project -> Active Runtime` and select your newly added .NET Runtime

![Active Runtime](/images/bcl-debug-3.png)


Now you can step into any Mono Base Class Library source files
