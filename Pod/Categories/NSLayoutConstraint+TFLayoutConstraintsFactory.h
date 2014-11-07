/*
 * Created by Julian Król on 10/09/14.
 * Copyright (c) 2014 Trifork A/S.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/**
 Constant representing undefined value
 */
static const CGFloat kTFNoMetric = NAN;

typedef NS_OPTIONS(NSUInteger, TFCenteringOption) {
    TFCenteringOptionNone = 0,
    TFCenteringOptionAxisX = 1 << 0,
    TFCenteringOptionAxisY = 1 << 1,
    TFCenteringOptionAbsolute = TFCenteringOptionAxisX | TFCenteringOptionAxisY
};

@interface NSLayoutConstraint (TFLayoutConstraintsFactory)

+ (NSArray *)tf_centerView:(UIView *)view toView:(UIView *)superview options:(TFCenteringOption)option offset:(CGPoint)offset;

/**
 Method returns constraints for views passed in viewsArray separated by objects in separatorsViewsArray. Moreover
 margins from left and right edges of a superview can be passed in margin argument.
 Both arrays can not be nil and number of separators can be less by 1 than number of views passed in viewsArray argument.
 @param viewsArray - array containing UIViews for which horizontal aligning constraints will be generated
 @param separatorsViewsArray - array containing UIViews which are separators between views for which alignment constraints will be generated
 @param margin - CGFloat value representing (left and right) margins from the superview's edges
 @returns array of NSLayoutConstraint objects which are generated constraints
 */
+ (NSArray *)tf_horizontalAlignmentConstraintsForViews:(NSArray *)viewsArray separatorViews:(NSArray *)separatorsViewsArray margins:(CGFloat)margin;

/**
  Method returns constraints for views passed in viewsArray separated by objects in separatorsViewsArray. Moreover
  margins from top and bottom edges of a superview can be passed in margin argument.
  Both arrays can not be nil and number of separators can be less by 1 than number of views passed in viewsArray argument.
  @param viewsArray - array containing UIViews for which vertical aligning constraints will be generated
  @param separatorsViewsArray - array containing UIViews which are separators between views for which alignment constraints will be generated
  @param margin - CGFloat value representing (top and bottom) margins from the superview's edges
  @returns array of NSLayoutConstraint objects which are generated constraints
 */
+ (NSArray *)tf_verticalAlignmentConstraintsForViews:(NSArray *)viewsArray separatorViews:(NSArray *)separatorsViewsArray margins:(CGFloat)margin;

/**
  Method returns array of constraints which adopt view to the superview size with defined in insets argument margins from each
  edge. If value passed as one of the insets value is kTFNoMetric then this value for margin is omitted.
  @param view UIView for which array of constraints will be generated and then returned
  @param insets - UIEdgeInsets struct containing margins to each superview's edge if kTFNoMetric set then this margin is not defined
  @returns array of NSLayoutConstraint objects which are generated constraints for a passed view
 */
+ (NSArray *)tf_constraintsForView:(UIView *)view expandingEdgesToSuperviewWithInsets:(UIEdgeInsets)insets;


/**
  Method returns array of width and/or height constraints for a view passed in view argument if one of the value is set to kTFNoMetric
  then constraint generation will be omitted for that metric.
  @param view - UIView for which array of constraints will be generated and then returned
  @param size - CGSize struct defining width and height to set in a constraint for a view
  @returns array of NSLayoutConstraint objects which are generated constraints for a passed view
 */
+ (NSArray *)tf_constraintsForView:(UIView *)view withSize:(CGSize)size;


@end
