# TFLayoutConstraintsFactory

[![CI Status](http://img.shields.io/travis/Julian Król/TFLayoutConstraintsFactory.svg?style=flat)](https://travis-ci.org/Julian Król/TFLayoutConstraintsFactory)
[![Version](https://img.shields.io/cocoapods/v/TFLayoutConstraintsFactory.svg?style=flat)](http://cocoadocs.org/docsets/TFLayoutConstraintsFactory)
[![License](https://img.shields.io/cocoapods/l/TFLayoutConstraintsFactory.svg?style=flat)](http://cocoadocs.org/docsets/TFLayoutConstraintsFactory)
[![Platform](https://img.shields.io/cocoapods/p/TFLayoutConstraintsFactory.svg?style=flat)](http://cocoadocs.org/docsets/TFLayoutConstraintsFactory)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Documentation

Method returns constraints for views passed in viewsArray separated by objects in separatorsViewsArray. Moreover 
margins from left and right edges of a superview can be passed in margin argument.
Both arrays can not be nil and number of separators can be less by 1 than number of views passed in viewsArray argument.
`+ (NSArray *)tf_horizontalAlignmentConstraintsForViews:(NSArray *)viewsArray separatorViews:(NSArray *)separatorsViewsArray margins:(CGFloat)margin;`

Method returns constraints for views passed in viewsArray separated by objects in separatorsViewsArray. Moreover 
margins from top and bottom edges of a superview can be passed in margin argument.
Both arrays can not be nil and number of separators can be less by 1 than number of views passed in viewsArray argument.
`+ (NSArray *)tf_verticalAlignmentConstraintsForViews:(NSArray *)viewsArray separatorViews:(NSArray *)separatorsViewsArray margins:(CGFloat)margin;`

Method returns array of constraints which adopt view to the superview size with defined in insets argument margins from each
edge. If value passed as one of the insets value is *kTFNoMetric* then this value for margin is omitted.
`+ (NSArray *)tf_constraintsForView:(UIView *)view expandingEdgesToSuperviewWithInsets:(UIEdgeInsets)insets;`

Method returns array of width and/or height constraints for a view passed in view argument if one of the value is set to *kTFNoMetric* 
then constraint generation will be omitted for that metric.
`+ (NSArray *)tf_constraintsForView:(UIView *)view withSize:(CGSize)size;`

## Installation

TFLayoutConstraintsFactory is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "TFLayoutConstraintsFactory"

## Author

Julian Król, viperking@poczta.onet.pl

## License

TFLayoutConstraintsFactory is available under the Apache 2.0 license. See the LICENSE file for more info.

