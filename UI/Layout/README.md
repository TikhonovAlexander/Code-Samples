# Layout


- `viewDidLoad`: Called after the view controller has loaded its view but not yet added it to the view hierarchy. Called only once in the life of the view controller.
- `viewWillAppear`: Called when the view controller’s view is about to be added to the view hierarchy. Unlike viewDidLoad this method can be called multiple times in the life of a view controller. There’s a corresponding viewWillDisappear called when the view is about to be removed from the view hierarchy.
- `viewDidAppear`: Called after view controller’s view is added to the view hierarchy and displayed on-screen. Like viewWillAppear this method can be called multiple times and has a corresponding method, viewDidDisappear, called after removing the view.

_It’s a common mistake to assume the size of views are correctly set in the `viewDidLoad` and `viewWillAppear` methods._
