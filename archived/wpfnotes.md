---
title: "WPFNotes"
lastmodified: '2007-05-21'
redirect_from:
  - /WPFNotes/
---

WPFNotes
========

This document tracks some notes as I explore Silverlight and WPF.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#storyboard-and-animations">1 Storyboard and Animations</a></li>
<li><a href="#interception-of-properties">2 Interception of Properties</a></li>
<li><a href="#simplified-class-hierarchy">3 Simplified Class Hierarchy</a>
<ul>
<li><a href="#paths">3.1 Paths</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Storyboard and Animations
=========================

Storylines can contain multiple animations, which use the timer infrastructure in the main loop to raise the events.

There is no separate thread to raise the events, it is possible to create an object that hangs for a few seconds when setting the value of a property:

``` csharp
PhotosProperty = DependencyPRoperty.Register ("Photos", typeof (int), typeof(Camera),
         new PropertyMetadata (32, changed_callback);
..
 
static void changed_callback (DependencyObject target,
                              DependencyPropertyChangedEventArgs e)
{
        System.Threading.Thread.Sleep (10000);
}
```

And to try this animation use:

``` csharp
class Window ... {
Camera c = new Camera ();
NameScope.SetNamespace (this, new NameScope ());
RegisterName ("camera", c);
Int32Animation anum = new Int32Animation (0, 10, new Duration (new TimeSpan (0, 0, 40));
Storyboard s = new Storyboard ();
s.Children.Add (anim);
 
// This is funky, you set these two properties through Storyboard,
// for the actual animation, not through the animation itself.
Storyboard.SetTargetName (anim, "camera");
Storyboard.SetTargetProperty (anim, new PropertyPath (Camera.PhotosProperty));
 
s.Begin (this);
```

Interception of Properties
==========================

Unlike .NET properties, where interception happens in the setter (to perform book-keeping) WPF has a runtime system for this purpose. The idea apparently was to build "lighter" objects by turning properties that would be seldom set into runtime settable properties that are kept on a dictionary.

To intercept value setting of those properties, the PropertyMetadata is used when creating the property in the call to DependencyProperty.Register, here some callbacks for get, set, invalidate and maybe a few others are provided, as well as the default value for the property.

Simplified Class Hierarchy
==========================

The following is a simplified class hierarchy for the rendering system that might help understand how things work. The words in parenthesis are the important properties introduced in a given class.

    BrowserHost

    InternalCollection<T>
        GeometryCollection
        GradientStopCollection
        Inlines
        KeyFrameCollection
        MediaAttributeCollection
        PathFigureCollection
        PathSegmentCollection
        ResourceCollection
        StrokeCollection
        StylusPointCollection
        TimelineCollection
        TimelineMarkerCollection
        TransformCollection
        TriggerActionCollection
        TriggerCollection
        VisualCollection

    Color
    Colors

    DependencyObject
        BeginStoryboard
        Brush
            GradientBrush
                LinearGradientBrush
                RadialGradientBrush
            SolidColorBrush
            TileBrush
                ImageBrush
                VideoBrush
        Downloader
        DrawingAttributes
        EventTrigger
        Geometry
            EllipseGeometry
            GeometryGroup
            LineGeometry
            PathGeometry
            RectangleGeometry
        GradientStop
        Inline
            LineBreak
            Run
        Ink.Stroke
        KeyFrame (KeyTime)
            ColorKeyFrame (Value)
                DiscreteColorKeyFrame
                LinearColorKeyFrame
                SplineColorKeyFrame (KeySpline)
            DoubleKeyFrame (Value)
                DiscreteDoubleKeyFrame
            LinearDoubleKeyFrame
            SplineDoubleKeyFrame
        PointKeyFrame (Value)
                DiscretePointKeyFrame
                LinearPointKeyFrame
                SplinePointKeyFrame
        KeySpline
        MediaAttribute
        PathFigure
        PathSegment
            ArcSegment
            BezierSegment
            LineSegment
            PolyBezierSegment
            PolyLineSegment
            PolyQuadraticBezierSegment
            QuadraticBezierSegment
        StylusInfo
        StylusPoint
        Timeline (Begin, Duration, Loop, Repeat, Fill, Speed)
            Animation
                ColorAnimation (From, To, By)
                    ColorAnimationUsingKeyFrames (KeyFrames)
                DoubleAnimation (From, To, By)
                    DoubleAnimationUsingKeyFrames (KeyFrames)
                PointAnimation (From, To, By)
                    PointAnimationUsingKeyFrames (KeyFrames)
        TimelineGroup (Children)
            ParallelTimeline
                Storyboard (TargetName, TargetProperty, control methods)
        TimelineMarker
        Transform (X, Y)
            MatrixTransform (Matrix)
            RotateTransform (Angle, CenterXY)
            ScaleTransform (CenterXY, ScaleXY)
            SkewTransform (AngleXY, CenterXY)
            TransformGroup (Children)
            TranslateTransform (X, Y)
        Visual (CaptureMouse)
            UIElement (Clip, Opacity, Transform, Resources, Triggers, Visibility)
                FrameworkElement (Height, Width, Parent)
                    Control (InitializeFromXaml)
                    Glyphs
                    MediaBase (Source, Stretch)
                        MediaElement (media player)
                    Panel (Background, Children)
                        Canvas (Left, Top)
                            InkPresenter (Strokes)
                    TextBlock
                    UIElement
                    Shape
                        Ellipse
                        Line
                        Path
                        Polygon
                        Polyline
                        Rectangle

    DependencyProperty
    Duration
    KeyTime
    Matrix
    MediaBase
        Image
    Point
    Rect
    Size
    RepeatBehavior

Paths
-----

Relationship of the various Path classes:

-   Paths contain Geometries
    -   GeometryGroup (a kind of Geometry) composes various existing geometries.
    -   PathGeometry (a kind of Geometry) contain PathFigureCollections
        -   PathFigureCollections are collections that contain PathFigures
            -   PathFigures are made up of PathSegments
