---
title: Clang Sanitizers
---

The Mono runtime can be compiled and linked with [Clang](https://clang.llvm.org/) and due to this, many of [Clang's sanitizers](https://clang.llvm.org/docs/index.html#using-clang-as-a-compiler) can be used to check and verify different aspects:

- [ThreadSanitizer (TSan)](/docs/debug+profile/clang/threadsanitizer/) &ndash; detect data races and thread leaks at runtime
- [AddressSanitizer (ASan)](/docs/debug+profile/clang/addresssanitizer/) &ndash; detect memory errors (mostly buffer over- / underflows) at runtime
