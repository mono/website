---
title: "CSCache / Mono cache tool (Calancea Daniel)"
---

Author:  [Calancea Daniel](https://github.com/dcalance)

### 1.Introduction

A friend of mine told me about this interesting event, google summer of code. Of course I've heard about it before but I wasn't sure how you can apply or what you need to do. He told me that there are a lot of interesting projects. I took a look
at the companies and projects and there were a lot of projects, most of them very advanced. At university I was doing my laboratories mostly in C#, since it's pretty easy and Visual Studio is pretty powerful as an IDE.
The most interesting thing is that when my friend told me about GSOC there were only 2 days left to apply. I applied to 3 projects from mono-project, but mostly wanted to work on the one with the cache tool, the one I was assigned to later.
Honestly, I had very little idea about how a compiler works, but I knew more or less what it takes to make or check a hash.

At first, it was pretty hard because I had no idea where to start but with help from my mentor and after reading documentation I started to understand what I need to do.

The hardest part was to make the first working program that would cache, store binaries and execute the compiler command.

At the end of the project I learned a lot of things that I'm more than sure will help me in the future. This was an interesting experience and I would gladly apply for GSOC at mono next year aswell.

This year at GSOC I applied to make a similar tool as ccache, but for mono. I worked in my repository entirely, later the mono team will fetch my repository and integrate it with their features. There are 3 main branches in the repository:
- Where the tool is located (master)
- Where are the unit tests made in MSTest (UnitTests)
- Where is the nuget package. (NugetPackage)

Link to the repository: [https://github.com/dcalance/GSOC17](https://github.com/dcalance/GSOC17)

The tool had to have the following features:
- Able to prevent repeated compilation of a program.
- Reports it’s own failures with error messages.
- Returns the error code that the underlying compiler returns (important for use with Make).
- Does not fail to recompile files that do change.
- Captures resources and other non-code files passed to compiler as well.

At the end these were the features implemented:
- Able to prevent repeated compilation of a program.
- Reports it’s own failures with error messages.
- Returns the error code that the underlying compiler returns (important for use with Make).
- Does not fail to recompile files that do change.
- Captures resources and other non-code files passed to compiler as well.
- Configuration file that allows to set a different compiler and such things as default extension, cache location, arguments to be ignored.
- Storage of the warnings at the compilation time, and printing them at a repeated compilation.
- Installation scripts for windows and unix.
- Nuget package.

The process of making the project was the following:
1. Reading documentation about ccache and mcs.
2. Make a method that will be able to execute a cmd/bash process with passed arguments.
3. Make the first working prototype that is able to store the cache and load it at a repeated compilation.
4. Make a configuration file that will replace all the hardcoded values.
5. Handle the possible error that can happen at argument passing.
6. Making a new parser to parse the compiler line.
7. Adding a more powerful argument parser by using OptionSet from Mono.Options.
8. Adding support for response files and modules.
9. Creating install files for windows and linux.

### 2.Implementation

The tool is a class library that has a bunch of classes:
- CSCache - is the main class that recieves the compiler with arguments in constructor and has a method `void Cache()` that caches the input arguments if there is no error.
- Config - class that handles the config. It generates config if it doesn't exist and stores the values read from config file in properties.
- ConsoleTools - a set of static methods that are used for executing and outputing error.
- FilesTools - a set of static methods that are used for working with files.
- LibArgs - a set of static methods that execute options passed to the tool.
- MD5Tools - a set of static methods that are for generating hashes.

The tool is minimalistic since the main objective is to be integrated in bigger environments such as monodevelop and it should work fast, otherwise there will be no use of the tool.

The classes that are with static members can be reused, that was the main propouse to make them static and public. For example:

#### ConsoleTools.cs

Contains the class ConsoleTools with the following methods and fields:
- `static bool IsUnix` - This field can determine if your OS is either unix or windows.
- `static string Execute(string cmdLine, out int errCode)` - This method allows execution of a command either in bash or cmd. The execution is based on the enviromnent from where the application was executed.
    - **string cmdLine** - The command line passed to the bash/cmd.
    - **out int errCode** - out parameter that returns the exit code of the executed command line.
    - **return** - string that contains the concatenation of standard error and standard output.
- `static void Error(string msg, int errCode)` - Exits the program and returns specified code.
    - **string msg** - Error message that will be displayed to user.
    - **int errCode** - Exit code of the application.

#### FilesTools.cs

Contains the class FilesTools and methods to work with files:
- `static string[] GetRecurseFiles(string pattern)` - Gets all files that are fitting the current pattern.
    - **string pattern** - pattern that will be evaluated.
    - **return** - an array of all the files found that correspond to the pattern.

#### MD5Tools.cs

Contains the class MD5Tools and methods for hashing:
- `static byte[] GenerateFilesCache(List<string> inputF)` - Generates a single MD5 hash from all the input files. Uses the following methods from the same class : **static byte[] MakeMD5File(string filename)**, **static byte[] CombineHashes(List<byte[]> input)**.
    - **List<string> inputF** - a list of input files location. The method throws unhandled error if the file does not exist.
    - **return** - a byte array that contains the hash that results from combining the hashes of each seaparte file.
- `static byte[] CombineHashes(List<byte[]> input)` - Generates a single MD5 hash from a list of hashes.
    - **List<byte[]> input** - a list of hashes of the same size.
    - **return** - a byte array that contains the hash of the input hashes.
- `static byte[] MakeMD5String(string input)` - Generates MD5 hash from the input string.
    - **string input** - Input string.
    - **return** - a byte array that is the result of hashing the current string.
- `static byte[] MakeMD5File(string filename)` - Generates MD5 hash from the content of the file.
    - **string filename** - The name of the input file.
    - **return** - a byte array that is the result of hashing the contents of the file.

#### ParseTools.cs

Contains the class ParseTools with methods for parsing:
- `static string[] ParseArguments(string commandLine)` - parses the input string as a command line argument.
    - **string commandLine** - the input string that will be parsed.
    - **return** - an array that contains the parsed arguments, all empty elements are removed before return.
- `static string generateOption(string[] argArr)` - parses an array of strings and generates a compatible option for OptionSet from Mono.Options.
    - **string[] argArr** - The input array that will be parsed.
    - **return** - a string that will be of form accepted as option in OptionSet. (Example: `o|out|output`)
- `string[] ParseResponseFile(string file)` - parses a response file into an array of strings. It uses the method **static string[] ParseArguments(string commandLine)**.
    - **string file** - The name of the file that will be parsed.
    - **return** - An array of strings that contains all arguments parsed, if the file does not exist the returned array will be with 0 elements.
- `static string[] ParseArgArrayWithResponse(string[] input)` - Parses a command line that contains response files and generates a final command line that is composed from original arguments and the ones from response files in correct order. This method is using **static string[] ParseResponseFile(string file)**.
    - **string[] input** - parsed command line arguments that contain response files. (Response files must be of form: @response.txt)
    - **return** - an array that contains the original arguments with parsed arguments from response file in original order.
- `static string[] ParseComaSemicolon(string input)` - Parses arguments that are delimited by comma or/and semicolon.
    - **string input** - string that is delimited with commas and/or semicolons.
    - **return** - array of strings with parsed elements.

### 3.Bugs

There is a bug regarding windows bash that I wasn't able to fix. The problem with it appears when you try to create a windows bash process and pass it a compiler line with arguments. The bug is that the paths that have dashes (example: folder1\input1.cs) does not have dashes anymore and compiler throws error that input files is not found. The problem is not at my level of implementation but either at process class or in the way the windows bash processes the input arguments. This bug may appear at random times.

### 4.Conclusion

This project was an interesting experience for me since it was entirely new, I've never worked at compiler level. Now I can understand more things about how compilers work, how arguments are passed and processed, how the output is generated. This project was great for learning because it was not very difficult and at the same time it had specific things that you can learn from it. The mentor was amazing and helped me in difficult situation at the same time leaving the entire thought process to me.