# Trait Collections

- You get the horizontal and vertical size classes of a view or view controller from its traitCollection property. Prefer designing your layout for the size class over the device idiom (iPhone or iPad) or orientation (portrait or landscape).
- Don’t forget about managing the keyboard in iPad split-view modes. The keyboard can cover your App even if you don’t accept text input.
- Adapt your layouts to size class changes using Interface Builder or by overriding traitCollectionDidChange in your view or view controller.
- A stack view saves you work when you want to switch between horizontal and vertical layouts or when you want to show or hide views selectively.
- To animate changes to your layouts when the size class or view size changes use the UIContentContainer methods in your view controller.
- Don’t forget that you can add size class specific images to the asset catalog.
- If you’re struggling to squeeze text with a fixed font into the available space try using localization strings dictionaries to create variations for different widths.
- Horizontal and vertical size classes give you a crude measure of how much screen space is available. When you need finer control create layout variations based on the available space. Use the content container methods to react to size changes in your view controller.
