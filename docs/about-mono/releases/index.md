---
title: Mono Releases
redirect_from:
  - /1.0/
  - /1.0.1/
  - /1.0.2/
  - /1.0.4/
  - /1.0.5/
  - /1.0.6/
  - /1.1.1/
  - /1.1.2/
  - /1.1.3/
  - /1.1.4/
  - /1.1.5/
  - /1.1.6/
  - /1.1.7/
  - /Release_Notes_Mono_2.0/
  - /Release_Notes_Mono_2.0.1/
  - /Release_Notes_Mono_2.2/
  - /Release_Notes_Mono_2.4/
  - /Release_Notes_Mono_2.4.2/
  - /Release_Notes_Mono_2.4.2.1/
  - /Release_Notes_Mono_2.4.2.2/
  - /Release_Notes_Mono_2.4.2.3/
  - /Release_Notes_Mono_2.4.3/
  - /Release_Notes_Mono_2.4.3.1/
  - /Release_Notes_Mono_2.6/
  - /Release_Notes_Mono_2.6.1/
  - /Release_Notes_Mono_2.6.3/
  - /Release_Notes_Mono_2.6.4/
  - /Release_Notes_Mono_2.6.7/
  - /Release_Notes_Mono_2.8/
  - /Release_Notes_Mono_2.8.1/
  - /Release_Notes_Mono_2.8.2/
  - /Release_Notes_Mono_2.10/
  - /Release_Notes_Mono_2.10.1/
  - /Release_Notes_Mono_2.10.2/
  - /Release_Notes_Mono_2.10.3/
  - /Release_Notes_Mono_2.10.4/
  - /Release_Notes_Mono_2.10.5/
  - /Release_Notes_Mono_2.10.6/
  - /Release_Notes_Mono_2.10.7/
  - /Release_Notes_Mono_2.10.8/
  - /Release_Notes_Mono_2.10.8.1/
  - /Release_Notes_Mono_2.10.9/
  - /Release_Notes_Mono_2.12/
  - /Release_Notes_Mono_3.0.0/
  - /Release_Notes_Mono_3.0.1/
  - /Release_Notes_Mono_3.0/
  - /Release_Notes_Mono_3.0.3/
  - /Release_Notes_Mono_3.0.4/
  - /Release_Notes_Mono_3.0.5/
  - /Release_Notes_Mono_3.0.6/
  - /Release_Notes_Mono_3.0.9/
  - /Release_Notes_Mono_3.0.10/
  - /Release_Notes_Mono_3.2/
  - /Release_Notes_Mono_3.2.3/
  - /Release_Notes_Mono_3.4/
  - /Release_Notes_Mono_3.6/
  - /Release_Notes_Mono_3.8/
  - /Release_Notes_Mono_3.10/
  - /Release_Notes_Mono_3.12/
  - /OldReleases/
---

This page contains a list of all Mono releases. The latest stable release is {{ site.data.stablerelease.version }}.<br/>
Mono version numbers follow a specific policy, learn more [here](/docs/about-mono/versioning/).

{% assign release_notes = site.pages | where: "layout", "releasenotes" | sort: "version" | reverse %}
{% assign date_sorted_release_notes = release_notes | sort: "releasedate" | reverse %}

Mono 5.x
--------

{% for p in release_notes %}
{% if p.releasedate == null %}
  - [_Mono {{ p.version }}_](/docs/about-mono/releases/{{ p.version }}) *(not released yet)*
{% endif %}
{% endfor %}

{% for p in release_notes %}
{% assign major_ver = p.version | split: '.' | first %}
{% if major_ver == '5' and p.releasedate and p.releasedate != '' %}
  - [Mono {{ p.version }}](/docs/about-mono/releases/{{ p.version }}) *({% if p.releasedate == 'skipped' %}skipped{% else %}{{ p.releasedate | date_to_string }}{% endif %})*
{% endif %}
{% endfor %}

Mono 4.x
--------

{% for p in date_sorted_release_notes %}
{% assign major_ver = p.version | split: '.' | first %}
{% if major_ver == '4' %}
  - [Mono {{ p.version }}](/docs/about-mono/releases/{{ p.version }}) *({{ p.releasedate | date_to_string }})*
{% endif %}
{% endfor %}

Mono 3.x
--------

{% for p in date_sorted_release_notes %}
{% assign major_ver = p.version | split: '.' | first %}
{% if major_ver == '3' %}
  - [Mono {{ p.version }}](/docs/about-mono/releases/{{ p.version }}) *({{ p.releasedate | date_to_string }})*
{% endif %}
{% endfor %}

Mono 2.x
--------

{% for p in date_sorted_release_notes %}
{% assign major_ver = p.version | split: '.' | first %}
{% if major_ver == '2' %}
  - [Mono {{ p.version }}](/docs/about-mono/releases/{{ p.version }}) *({{ p.releasedate | date_to_string }})*
{% endif %}
{% endfor %}

Mono 1.x
--------

{% for p in date_sorted_release_notes %}
{% assign major_ver = p.version | split: '.' | first %}
{% if major_ver == '1' %}
  - [Mono {{ p.version }}](/docs/about-mono/releases/{{ p.version }}) *({{ p.releasedate | date_to_string }})*
{% endif %}
{% endfor %}

Mono 0.x
--------

{% for p in date_sorted_release_notes %}
{% assign major_ver = p.version | split: '.' | first %}
{% if major_ver == '0' %}
  - [Mono {{ p.version }}](/docs/about-mono/releases/{{ p.version }}) *({{ p.releasedate | date_to_string }})*
{% endif %}
{% endfor %}
