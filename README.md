# TFLayoutConstraintsFactory

[![CI Status](http://img.shields.io/travis/Julian Król/TFLayoutConstraintsFactory.svg?style=flat)](https://travis-ci.org/Julian Król/TFLayoutConstraintsFactory)
[![Version](https://img.shields.io/cocoapods/v/TFLayoutConstraintsFactory.svg?style=flat)](http://cocoadocs.org/docsets/TFLayoutConstraintsFactory)
[![License](https://img.shields.io/cocoapods/l/TFLayoutConstraintsFactory.svg?style=flat)](http://cocoadocs.org/docsets/TFLayoutConstraintsFactory)
[![Platform](https://img.shields.io/cocoapods/p/TFLayoutConstraintsFactory.svg?style=flat)](http://cocoadocs.org/docsets/TFLayoutConstraintsFactory)

This library is a category on NSLayoutConstraint that adds a few helpful methods for generating auto layout constraints.

## Documentation

Below short description of the public interface can be found.

### Constants

Constant representing undifined value:

    static const CGFloat kTFNoMetric = NAN;


### Horizontal aligning

    + (NSArray *)tf_horizontalAlignmentConstraintsForViews:(NSArray *)viewsArray 
                                            separatorViews:(NSArray *)separatorsViewsArray 
                                                   margins:(CGFloat)margin;

Above method returns constraints for views passed in viewsArray separated by objects in separatorsViewsArray. Moreover
margins from left and right edges of a superview can be passed in margin argument.
Both arrays can not be nil and number of separators can be less by 1 than number of views passed in viewsArray argument.

`viewsArray` - array containing UIViews for which horizontal aligning constraints will be generated

`separatorsViewsArray` - array containing UIViews which are separators between views for which alignment constraints will be genereated

`margin` - CGFloat value representing (left and right) margins from the superview's edges

Returns array of NSLayoutConstraint objects which are generated constraints

### Vertical aligning

    + (NSArray *)tf_verticalAlignmentConstraintsForViews:(NSArray *)viewsArray 
                                          separatorViews:(NSArray *)separatorsViewsArray 
                                                 margins:(CGFloat)margin;  

Above method returns constraints for views passed in viewsArray separated by objects in separatorsViewsArray. Moreover
margins from top and bottom edges of a superview can be passed in margin argument.
Both arrays can not be nil and number of separators can be less by 1 than number of views passed in viewsArray argument.

`viewsArray` - array containing UIViews for which vertical aligning constraints will be generated

`separatorsViewsArray` - array containing UIViews which are separators between views for which alignment constraints will be genereated

`margin` - CGFloat value representing (top and bottom) margins from the superview's edges

Returns array of NSLayoutConstraint objects which are generated constraints

### Margins to superview

    + (NSArray *)tf_constraintsForView:(UIView *)view expandingEdgesToSuperviewWithInsets:(UIEdgeInsets)insets;

Above method returns array of constraints which adopt view to the superview size with defined in insets argument margins from each
edge. If value passed as one of the insets value is kTFNoMetric then this value for margin is omitted.

`view` - UIView for which array of constraints will be generated and then returned

`insets` - UIEdgeInsets struct containing margins to each superview's edge if *kTFNoMetric* set then this margin is not defined

Returns array of NSLayoutConstraint objects which are generated constraints for a passed view

### Size setting

    + (NSArray *)tf_constraintsForView:(UIView *)view withSize:(CGSize)size;

Above method returns array of width and/or height constraints for a view passed in view argument if one of the value is set to *kTFNoMetric*
then constraint generation will be omitted for that metric.

`view` - UIView for which array of constraints will be generated and then returned

`size` - CGSize struct defining width and height to set in a constraint for a view

Returns array of NSLayoutConstraint objects which are generated constraints for a passed view


## Installation

TFLayoutConstraintsFactory is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "TFLayoutConstraintsFactory"

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Julian Król, viperking@poczta.onet.pl

(In case of any bugs or ideas for extension, feel free to drop me an email)

## License

TFLayoutConstraintsFactory is available under the Apache 2.0 license. See the LICENSE file for more info.

