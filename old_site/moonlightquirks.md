---
layout: obsolete
title: "MoonlightQuirks"
lastmodified: '2008-12-08'
permalink: /old_site/MoonlightQuirks/
redirect_from:
  - /MoonlightQuirks/
---

MoonlightQuirks
===============

This page is meant to list various undocumented (or unclear) features/properties of Silverlight and their respective implementations details in Moonlight. Information here comes from experimentation, tests and bits found over the web.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#animations">1 Animations</a>
<ul>
<li><a href="#one-animation-per-property">1.1 One animation per property</a></li>
<li><a href="#animations-inherit-base-value">1.2 Animations inherit base value</a></li>
<li><a href="#filling-clocks-and-updating-values">1.3 Filling clocks and updating values</a></li>
<li><a href="#timespan-based-repeatbehavior">1.4 Timespan-based RepeatBehavior</a></li>
<li><a href="#keysplines">1.5 Keysplines</a></li>
</ul></li>
<li><a href="#media">2 Media</a>
<ul>
<li><a href="#setting-the-source-property-to-empty">2.1 Setting the Source property to empty</a></li>
</ul></li>
<li><a href="#text">3 Text</a>
<ul>
<li><a href="#textdecorations-property">3.1 TextDecorations Property</a></li>
<li><a href="#fontweighs-property">3.2 FontWeighs Property</a></li>
</ul></li>
<li><a href="#plugin-detection">4 Plugin detection</a>
<ul>
<li><a href="#greasemonkey">4.1 GreaseMonkey</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Animations
----------

### One animation per property

Silverlight has a mechanism were there can be only one animation attached and animating a property on an object. It's (not surprisingly) the last one started. The previous animation(s) stop updating the property value as soon as the new storyboard is Begin'ed.

Reasons for doing this on SL side are unclear (performance?) but it definitely makes it easier to manage animations -- since you don't have to care about stopping previous animations and keeping track of SB's running.

In Moonlight we implement this by storing a hash table for each *DependencyProperty* with *DependencyObject* =\> *AnimationStorage* (key =\> value) relationship. For a given property on a given object (key) we store the currently active *AnimationStorage*. When a new *AnimationStorage* is attached for same params we mark the previous one as non-updating and detach the update handlers for it.

### Animations inherit base value

This is closely related to the previous feature described (one animation per property). When a new animation is started on a property/object that already has an animation, the new animation inherits it's base value from the previous one -- as opposed to using the current property value as the base value. Therefore stopping this second animation will reset the object's property value to the base value of the first animation.

This is best described by example. Let's assume we've got an object which has an initial position *(Canvas.Left)* of 10. We've got first animation which animates this property *To* 100. A second storyboard animates this property *To* 200. In this case:

-   We start first animation, object moves to a *(Canvas.Left)* of 100
-   We start second animation, object moves to a *(Canvas.Left)* of 200
-   We stop the second animation, object returns to a *(Canvas.Left)* of 10.

Without base value inheriting, the object would return to a *(Canvas.Left)* of 100 (the value of the property when second animation was started). This feature essentially makes it easier to create continuous self-expanding animations that terminate/reflow at some point.

In Moonlight we implement this by fetching the base value from the *AnimationStorage* obtained from property hash table (as described above) -- if available. There is one extra quirk involved in this: since the *AnimationStorage* is owned by the parent *AnimationClock* (animation) it can (in some corner js cases) get destroyed before we get a chance to obtain the base value. We detect those cases and make sure the *AnimationStorage* (detached from original parent) floats on the property hash table.

### Filling clocks and updating values

Silverlight documentations describes filling clocks (*FillBehavior="HoldEnd"*) as infinitely running and updating (resetting) the target property value. MSDN even warns (need quote here) that you should be aware of a situation where a filling clock is running and you're manually trying to update the prop value -- seeing no effect of your change since the property is reset by the clock.

This is, however, not true at the implementation level. It seems that in Silverlight filling clocks are not being ticked anymore. To be precise: *ClockGroup's* that are filling and have only filling clocks as children are not being ticked anymore.

In Moonlight we implement this behavior by setting an **idle\_hint** on *ClockGroup's* that are filling and contain only filling children. Idle hinted groups are not being ticked by parent groups.

The reason for doing so is clearly performance. Since the *HoldEnd* behavior is the most common/popular one, dumbly ticking/resetting values over themselves all the time (and possibly triggering huge expose chains) is a huge performance hit. Actually, enabling this MSDN-described behavior in Moonlight makes most of the bigger sites (ie. Showcase) absolutely unusable because of performance problems.

### Timespan-based RepeatBehavior

Silverlight allows the *RepeatBehavior* to be specified as a timespan ie. *RepeatBehavior="00:00:06"* (as opposed to standard multiplier specification, ie. *RepeatBehavior="3x"*). In this case a 2 second long animation will be repeated 3 times (6 seconds / 2 seconds = 3).

However, Silverlight 1.0 has a bug and timespan-based *RepeatBehavior* is not processed correctly (it looks like the timespan specified as *RepeatBehavior* is always equal to animation duration, except for 0:0:0 which is interpreted correctly as 0). This is fixed in Silverlight 2.0. In Moonlight we currently stick to the Silverlight 1.0 implementation (we simulate the bug).

It's possible to build Moonlight without the bug simulation (doing the proper Silverlight 2.0 implementation) by passing *--with-compatibility-bugs=no* to the configure script.

The differences between the two implementations can be seen in *clock14.xaml* and *clock31.xaml* tests in the *test/xaml/clock* directory. Also the *AnimationMatrix2* test uses a timespan-based *RepeatBehavior*.

### Keysplines

One of the Silverlight animation capabilities is the possibility to specify spline keyframes with a custom *KeySpline* interpolation method. This way various value-transition effects can be achieved - such as ease-in/ease-out, sharp-in etc. This is achieved by defining a *KeySpline* property. It takes two parameters which define the two control points (the second and third) of the bezier curve representing the animation dynamics. The first and last points of the curve are respectively hard-fixed to x=0, y=0 and x=1 and y=1.

The way this bezier curve maps to animation dynamics can be explained by quoting the [MSDN documentation](http://msdn2.microsoft.com/en-us/library/ms533119(VS.85).aspx):

*"...think of the horizontal axis as the pace with which the interpolation proceeds along the timing interval. The vertical axis is the resulting value for the animation's progress, yielded by the function that underlies the keySplines property. Another way of describing this is that the horizontal axis is the input unit time for the interval, and the vertical axis is the output unit time..."*

This means that the implementation needs to do a "Y for given X" bezier lookup. From the pov of the maths and the nature of the bezier (cubic) curves such a lookup is very hard to perform. In the land of cubics (third-degree parametric curves) there is no functional "Y for X" expression to evaluate since it's a third-degree equation which can have more than one solution (ie. a curve can have multiple Y values for one X). In other words, it's not trivial to resolve X into Y without doing complex (slow) computations and essentially solving a third-degree equation for every frame.

In Moonlight we first tried to solve the problem by using lookup tables - one per each KeySpline. This was fine for short animations (less than 1-2s) but failed for longer animations due to finite resolution of the lookup table. It was causing the animation to be non-smooth (continuous) but rather step-based (*test-animation-slow-keyspline.xaml* exposes this problem). Additionally it wasted memory per each KeySpline.

Another approach used a two-step curve approximation routine. It was a very fast and simple implementation but (depending on the curve type) it produced slightly off (simplified) results.

We're currently using a joint approach -- upon creation the curve is subdivided into 16 smaller curves using De Casteljau's algorithm. Those curves are approximated then to quadratic (second-degree) curves and stored as such within the KeySpline. Given an X, we can quickly figure out the first quadratic segment that covers it. Given a quadratic segment, we can do a very quick Y for X lookup using standard second-degree equation.

This solution is very accurate and extremally fast.

Media
-----

### Setting the Source property to empty

Setting the *Source* property on an *Image* or *MediaElement* element to an empty string or *null* will make the element render nothing as opposed to continuing to render the previous source (if an *Image*) or most recently rendered video frame (if a *MediaElement*).

Text
----

### TextDecorations Property

It would appear that the *TextDecorations* properties on *TextBlock* and *Inline* are a bit field as opposed to an enumeration. This isn't immediately apparent because, currently, *TextDecorations* only has two values: *None* (which has a value of 0) and *Underline* (which has a value of 1). The true behavior of *TextDecorations* can be seen in *tests/xaml/enums/textdecorations-inline.html* and *tests/xaml/enums/textdecorations-textblock.html*.

### FontWeighs Property

In addition to the defined *FontWeights* ranges, Silverlight treats the range from -475 to 0 as *Bold* and any value over 1023 as *Normal*.

Plugin detection
----------------

Some sites using a custom version of Silverlight.js are not detecting moonlight correctly, however, after some reloads they do. Examples:

-   [http://channel9.msdn.com](http://channel9.msdn.com)
-   [http://sessions.visitmix.com](http://sessions.visitmix.com)

### GreaseMonkey

Some sites are still using an outdated method of detecting the Silverlight/Moonlight plugin. This bug was published in Microsoft's early versions of Silverlight.js. It has since been fixed but some sites have not updated their file. To work around this, you can install the [GreaseMonkey](https://addons.mozilla.org/en-US/firefox/addon/748) plugin and [our script](http://anonsvn.mono-project.com/viewvc/trunk/moon/data/silverlight-ff3-quirks.user.js) to get these sites to work.

