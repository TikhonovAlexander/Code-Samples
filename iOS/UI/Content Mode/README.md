# Content Mode

The `contentMode` property of UIView controls how to adjust a view when its bounds change. The system will not, by default, redraw a view each time the bounds change. That would be wasteful. Instead, depending on the content mode, it can scale, stretch or keep the contents in a fixed position.

There are thirteen different content modes, but it’s easiest to think of three main groups based on the effect:

* Scaling the content (with or without maintaining the aspect ratio)
* Positioning the content
* Redrawing the content

## Scaling the View

* `scaleToFill`: Stretches the content to fill the available space without maintaining the aspect ratio. The default mode.
* `scaleAspectFit`: Scales the content to fit the space maintaining the aspect ratio.
* `scaleAspectFill`: Scales the content to fill the space maintaining the aspect ratio. The content can end up larger than the bounds of the view resulting in clipping.

*If your deployment target is iOS 11 or later and you want to use PDF vector images that are scaled smoothly without blurring at runtime make sure you select “Preserve Vector Data” in the asset catalog (you only see the difference when running on a device)*

## Positioning the View

If you don’t want to scale or stretch the view, you can pin it to one of nine possible positions.

* `.center`
* `.top`, `.bottom`, `.left`, `.right`
* `.topLeft`, `.topRight`, `.bottomLeft`, `.bottomRight`

## Redrawing the View

The `.redraw` mode triggers the `setNeedsDisplay()` method on the view when the bounds change allowing the view to redraw itself. You probably want this mode if you have a custom `UIView` that implements `draw(_:)` to draw its content within the view bounds.
