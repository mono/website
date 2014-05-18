---
layout: docpage
title: Mono Releases
navgroup: docs
mono3xreleases:
 - {version: 3.4.0}
 - {version: 3.2.8}
 - {version: 3.2.7, date: '2014-02-24'}
 - {version: 3.2.6}
 - {version: 3.2.5}
 - {version: 3.2.4, date: '2013-11-14'}
 - {version: 3.2.3}
 - {version: 3.2.2}
 - {version: 3.2.1}
 - {version: 3.2.0, date: '2013-07-24'}
 - {version: 3.1.2}
 - {version: 3.1.1}
 - {version: 3.0.12}
 - {version: 3.0.10}
 - {version: 3.0.9}
 - {version: 3.0.8}
 - {version: 3.0.7}
 - {version: 3.0.6}
 - {version: 3.0.5}
 - {version: 3.0.4}
 - {version: 3.0.3}
 - {version: 3.0.2}
 - {version: 3.0.0}
mono2xreleases:
 - {version: 2.10.9}
 - {version: 2.10.8, date: '2011-12-19'}
 - {version: 2.10.8.1, date: '2011-12-19'}
 - {version: 2.10.7, date: '2011-12-13'}
 - {version: 2.10.6, date: '2011-10-14'}
 - {version: 2.10.5, date: '2011-08-24'}
 - {version: 2.10.4, date: '2011-08-09'}
 - {version: 2.10.3, date: '2011-08-04'}
 - {version: 2.10.2, date: '2011-04-25'}
 - {version: 2.10.1, date: '2011-02-25'}
 - {version: 2.10.0, date: '2011-02-15'}
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
