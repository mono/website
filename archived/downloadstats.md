---
title: "DownloadStats"
lastmodified: '2008-07-02'
redirect_from:
  - /DownloadStats/
---

DownloadStats
=============

Download Stats
--------------

There are scripts to collect apache logs from ftp.novell.com and run webalizer against them.

They are at:

    release/website/download_stats

run './collect_and_gen_reports' from this directory. An account on ftp.novell.com is required.

This will create webalizer html output to:

    output/www_ftp

and

    output/www_http

Some distribution stats will be located at:

    output/distro_stats.txt

that will give an idea of architecture and distribution popularity.

