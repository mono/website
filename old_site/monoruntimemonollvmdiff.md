---
layout: obsolete
title: "Mono:Runtime:mono-llvm.diff"
lastmodified: '2009-09-28'
permalink: /old_site/Mono:Runtime:mono-llvm.diff/
redirect_from:
  - /Mono:Runtime:mono-llvm.diff/
---

Mono:Runtime:mono-llvm.diff
===========================

    diff --git a/configure.in b/configure.in
    index 9e38702..bf2d767 100644           
    --- a/configure.in                      
    +++ b/configure.in                      
    @@ -235,7 +235,7 @@ AM_CONDITIONAL(PLATFORM_SIGPOSIX, test x$use_sigposix = xyes)
     AC_CHECK_TOOL(CC, gcc, gcc)                                                     
     AC_PROG_CC                                                                      
     # Disabled for now to fix the windows build                                     
    -#AC_PROG_CXX                                                                    
    +AC_PROG_CXX                                                                     
     AM_PROG_AS                                                                      
     AM_PROG_CC_STDC                                                                 
     AC_PROG_INSTALL                                                                 
    diff --git a/mono/mini/Makefile.am b/mono/mini/Makefile.am                       
    index 4c73518..9656e80 100644                                                    
    --- a/mono/mini/Makefile.am                                                      
    +++ b/mono/mini/Makefile.am                                                      
    @@ -226,9 +226,9 @@ posix_sources = \                                            
                                                                                     
     if ENABLE_LLVM                                                                  
     # Disabled for now to fix the windows build                                     
    -#llvm_sources = \                                                               
    -#      mini-llvm.c             \                                                
    -#      mini-llvm-cpp.cpp                                                        
    +llvm_sources = \                                                                
    +       mini-llvm.c             \
    +       mini-llvm-cpp.cpp
     endif

     common_sources = \

