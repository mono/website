---
layout: docpage
title: Mono Releases
navgroup: docs
mono3xreleases:
 - {version: 3.2.7, date: '2014-02-24'}
 - {version: 3.2.4, date: '2013-11-14'}
mono2xreleases:
 - {version: 2.10.9}
 - {version: 2.10.8}
 - {version: 2.10.8.1}
 - {version: 2.10.7}
 - {version: 2.10.6}
 - {version: 2.10.5}
 - {version: 2.10.4}
 - {version: 2.10.3}
 - {version: 2.10.2}
 - {version: 2.10.1}
 - {version: 2.10.0}
 - {version: 2.8.2}
 - {version: 2.8.1}
 - {version: 2.8.0}
 - {version: 2.6.7}
 - {version: 2.6.4}
 - {version: 2.6.3}
 - {version: 2.6.1}
 - {version: 2.6.0}
 - {version: 2.4.3.1}
 - {version: 2.4.3}
 - {version: 2.4.2.3}
 - {version: 2.4.2.2}
 - {version: 2.4.2.1}
 - {version: 2.4.0}
 - {version: 2.2.0}
 - {version: 2.0.1}
 - {version: 2.0.0}
mono1xreleases:
 - {version: 1.9.1}
 - {version: 1.9.0}
 - {version: 1.2.6}
 - {version: 1.2.5}
 - {version: 1.2.4}
 - {version: 1.2.3}
 - {version: 1.2.2}
 - {version: 1.2.1}
 - {version: 1.2.0}
 - {version: 1.1.18}
 - {version: 1.1.17}
 - {version: 1.1.16}
 - {version: 1.1.15}
 - {version: 1.1.14}
 - {version: 1.1.13}
 - {version: 1.1.12}
 - {version: 1.1.10}
 - {version: 1.1.9}
 - {version: 1.1.8}
 - {version: 1.1.7}
 - {version: 1.1.6}
 - {version: 1.1.5}
 - {version: 1.1.4}
 - {version: 1.1.3}
 - {version: 1.1.2}
 - {version: 1.1.1}
 - {version: 1.0.6}
 - {version: 1.0.5}
 - {version: 1.0.4}
 - {version: 1.0.2}
 - {version: 1.0.1}
 - {version: 1.0.0}
---

This page contains a list of all Mono releases. The latest release can be found [here]({{site.github.url}}/download).

## Mono 3.x
{% for release in page.mono3xreleases %}
  - [Mono {{ release.version }}]({{site.github.url}}/docs/releases/{{ release.version }}) {% if release.date %} *({{ release.date | date_to_string }})* {% endif %}
{% endfor %}

## Mono 2.x
{% for release in page.mono2xreleases %}
  - [Mono {{ release.version }}]({{site.github.url}}/docs/releases/{{ release.version }}) {% if release.date %} *({{ release.date | date_to_string }})* {% endif %}
{% endfor %}

## Mono 1.x
{% for release in page.mono1xreleases %}
  - [Mono {{ release.version }}]({{site.github.url}}/docs/releases/{{ release.version }}) {% if release.date %} *({{ release.date | date_to_string }})* {% endif %}
{% endfor %}
