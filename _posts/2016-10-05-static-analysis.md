---
layout: blog
title: "Suspicious code fragments in 'Mono', detected by static analysis"
author: Sergey Vasiliev
tags: [static analysis]
---
Static analyzers are tools that allow developers to find bugs in the source code. 
No one is immune to errors - neither novice developers, nor professionals; 
the question is how often they make them. And the larger the project, the more bugs are there. 

# Bugs found in 'Mono'

One of the tools that allow detecting bugs in the source code is a static code analyzer PVS-Studio, 
supporting the analysis of code written in C, C++ and C#. 
It detected a good number of suspicious fragments, some of which are described in the [article](http://www.viva64.com/en/b/0431/). 
In sum total, there were mentioned or described  about 167 suspicious code fragments. 
However, these are not all the fragments detected by the analyzer. 
A lot of them remain outside the scope of this article, as it would increase its considerable volume even more.

# Interpreting warnings of the static analyzer

It should be clear, that not all warnings of a static code analyzer are real errors. 
That's why there is a division of diagnostic messages by the levels of reliability. 
Thus, there are three reliability levels in PVS-Studio. In the [article](http://www.viva64.com/en/b/0431/), mentioned before, 
there are mostly errors of the first level. 
Which means, that most probably the majority of the cited code fragments are real bugs. 
Nevertheless, it's up to a programmer to decide, whether the warning really indicates an error or not. 
It's also an evident fact that the number of errors increases with the size of the code base, regardless of the project type. 
Such a large number of suspicious fragments is mostly determined by an impressive project size - it was an expected result. 

# The necessity of using a static analyzer on a regular basis 

Despite the fact that during the analysis there were a lot of bugs found, one-time checks won't be of much use. 
The one-time check would be useful to demonstrate the abilities and the benefits from the static analysis, 
but to gain the most profit, developers should use it regularly, 
which will help to detect errors on the earliest stages of development, thereby reducing the time 
of searching and fixing incorrect code fragments and as result - the cost of the software development. 
More details on this topic are given in the [article](http://www.viva64.com/en/b/0431/). 

# Conclusion

By the example of a static analyzer PVS-Studio and the 'Mono' source code you may see that there are bugs in every project 
and the bigger the project, the more bugs are there. 
Static analysis tools are designed to help the programmer find errors of the early stages of writing the code 
and their use can bring a great benefit to the developers and the project in general, if used correctly, of course. 
