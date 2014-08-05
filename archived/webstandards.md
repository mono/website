---
title: "WebStandards"
lastmodified: '2005-09-06'
redirect_from:
  - /WebStandards/
---

WebStandards
============

This page should grow to describe where Mono's ASP.NET implementation stands in terms of compliance with Web standards as defined by the [W3C](http://www.w3.org/).

It will hopefully also eventually provide a roadmap for achieving fuller compliance.

The ultimate goal can be stated as making sure Mono's Web platform:

-   Produces well-formed XML
-   Produces valid XHTML 1.1
-   Does not generate 'placeholder' tags or other non-semantic markup
-   Separates content and style (semantic XHTML and CSS, also avoiding 'style' attributes in favour of stylesheets)
-   Encourages accessible design

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#non-semantic-markup">1 Non-semantic markup</a></li>
<li><a href="#id-tags">2 id tags</a></li>
<li><a href="#style-and-content">3 Style and content</a></li>
<li><a href="#aspnet-20">4 ASP.NET 2.0</a></li>
<li><a href="#other-thoughts">5 Other thoughts</a></li>
</ul></td>
</tr>
</tbody>
</table>

Non-semantic markup
-------------------

Elements like this have no place on the Web in 2005:

``` nowiki
<input type="hidden" name="__VIEWSTATE" value="DA0ADgEFAQ4BDQAOAwUBBQMFBQ4DDQwMDgEBB0VuYWJsZWQOAQgAAAANDAwOAQIAAA4BCAAAAA0MDA4BAgAADgEIAAAAAA==" />
```

(Seen in output from Mono ASP.NET)

It seems to be there to provide some kind of "stateful" browsing, but not only does it go against the spirit of the HTML standards, but also seems to make Back/Forward button behaviour even less intuitive for the average user.

id tags
-------

'id' attributes can't start with underscores. It's the law. "id and name attributes must begin with a letter, not a digit."

Style and content
-----------------

``` nowiki
<table id="myTable" cellpadding="2" cellspacing="1" border="2" bordercolor="blue">
```

This is no good.

ASP.NET 2.0
-----------

[XHTML and Accessibility in ASP.NET Whidbey](http://weblogs.asp.net/scottgu/archive/2003/11/25/39620.aspx): "In the end we walked away though with a plan that will enable us to output XHTML 1.1 by default."

Other thoughts
--------------

[http://www.codeproject.com/aspnet/ASPNET2XHTML.asp](http://www.codeproject.com/aspnet/ASPNET2XHTML.asp)

[http://www.liquid-internet.co.uk/content/dynamic/pages/series1article1.aspx](http://www.liquid-internet.co.uk/content/dynamic/pages/series1article1.aspx)

