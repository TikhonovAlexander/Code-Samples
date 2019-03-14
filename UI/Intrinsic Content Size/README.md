# Intrinsic Content Size

Common UIKit controls like the button, label, switch, stepper, segmented control, and text field have both an intrinsic width and height.

## UIButton

The text and the font used can change the intrinsic content size of a button. If you use insets to add padding or move the image or title be aware that only `contentEdgeInsets` has any effect on the intrinsic content size.
The `titleEdgeInsets` and `imageEdgeInsets` position the title and image during layout after the system sets the button size. They don’t change the intrinsic content size.

Changing layer properties like the corner radius doesn’t change the
intrinsic content size.

## UILabel

`numberOfLines = 1`
* `label.intrinsicContentSize // (w 853 h 20.5)`
* `label.bounds.size // (w 343 h 20.5)`

`numberOfLines = 0` and height of text is free
* `label.intrinsicContentSize // (w 333 h 64.5)`
* `label.bounds.size // (w 343 h 64.5)`

## UISlider and UIProgressView

The UISlider and its close relation the UIProgressView are unusual for UIKit controls in that they only have an intrinsic height, not a width.

`slider.intrinsicContentSize // (w -1 h 30)`

## UIImageView

The size of the image sets the intrinsic content size of an image view. An empty image view doesn’t have an intrinsic content size.

`let imageView = UIImageView()
imageView.intrinsicContentSize // (w -1 h -1)`

`imageView.image = UIImage(named: "Star")
imageView.intrinsicContentSize // (w 100 h 100)`

## UITextView

A text view that has scrolling `enabled` doesn’t have an intrinsic content size. You must constrain the width and height. The text view shows the text in the available space scrolling if needed.

With scrolling `disabled` a text view acts as a `UILabel` with `numberOfLines = 0`. Unless you constrain the width a text view has the intrinsic content size for a single line of text (assuming no carriage returns). Once you constrain the width, the text view sets its intrinsic content size height for the number of lines needed to show the text at that width.

## Views With No Intrinsic Content Size

A plain old `UIView` has no content so has no intrinsic content size. Scroll views, web views and text views with scrolling allowed don’t have an intrinsic content size. You must add constraints for the width and height. The view then shows its content in the available space scrolling if necessary.

![](.png)
