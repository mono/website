---
title: Advanced Mono Compile Options
redirect_from:
  - /Advanced_Mono_Compile_Options/
---

It is possible to tune your Mono configuration to your particular needs by using configure-time options.

A complete list of options are shown if you run the configure script with the --help option, but here we describe some important elements.

These are configuration options that the Mono team does provide support for.

### Xen Support

If you are planning on running Mono on Xen instances, you should use the --with-xen_opt=yes flag.

This will make Mono use a Xen-friendly set of TLS operations.

This is a supported configuration option.

### Prefix

There are a number of options that control where Mono will install its files.

Usually Mono is rooted on a "prefix", and binaries, libraries, data files, manual pages are then based from this prefix. To customize the prefix, you pass the --prefix command line option to configure.
