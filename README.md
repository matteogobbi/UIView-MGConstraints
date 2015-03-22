UIView+MGConstraints
==================

Category which allows to store, remove and replace easily constraints.

## Info

This code must be used under ARC. 
If your code doesn't use ARC you can [mark this source with the compiler flag](http://www.codeography.com/2011/10/10/making-arc-and-non-arc-play-nice.html) `-fobjc-arc` 

## Example Usage

Suppose to have a variable constraints, which should radically change (for instance when the user rotates the device). The default state would be this:

```objc
NSArray *viewConstraints =
[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-exampleView-|" options:0 metrics:metrics views:views];
```

as we want to replace this constraint, but also keeping our code clean, first of all when we declare the constraint we use the following code to add it to the view, and store it:

```objc
static NSString * const kMGHorizontalViewConstraints = @"kMGHorizontalViewConstraints";

NSArray *viewConstraints =
[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-exampleView-|" options:0 metrics:metrics views:views];

[view addAndStoreConstraints:viewConstraints forKey:kMGHorizontalViewConstraints];
```

Then, at the moment of the rotation:

```objc
NSArray *viewConstraints =
[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-exampleView-10-newView-50-|" options:0 metrics:metrics views:views];

[view replaceConstraintsForKey:kMGHorizontalViewConstraints withConstraints:viewConstraints];
```

## Contact

Matteo Gobbi

- http://www.matteogobbi.it
- http://github.com/matteogobbi
- http://twitter.com/matteo_gobbi
- https://angel.co/matteo-gobbi
- http://www.linkedin.com/profile/view?id=24211474

## License

UIView+MGConstraints is available under the MIT license.
