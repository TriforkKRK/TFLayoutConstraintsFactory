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

static const CGFloat kTFNoMetric = NAN;

@interface NSLayoutConstraint (TFLayoutConstraintsFactory)

/*
 * Method returns constraints for views passed in viewsArray separated by objects in separatorsViewsArray. Moreover 
 * margins from left and right edges of a superview can be passed in margin argument.
 * Both arrays can not be nil and number of separators can be less by 1 than number of views passed in viewsArray argument.
 */
+ (NSArray *)tf_horizontalAlignmentConstraintsForViews:(NSArray *)viewsArray separatorViews:(NSArray *)separatorsViewsArray margins:(CGFloat)margin;

/*
 * Method returns constraints for views passed in viewsArray separated by objects in separatorsViewsArray. Moreover 
 * margins from top and bottom edges of a superview can be passed in margin argument.
 * Both arrays can not be nil and number of separators can be less by 1 than number of views passed in viewsArray argument.
 */
+ (NSArray *)tf_verticalAlignmentConstraintsForViews:(NSArray *)viewsArray separatorViews:(NSArray *)separatorsViewsArray margins:(CGFloat)margin;

/*
 * Method returns array of constraints which adopt view to the superview size with defined in insets argument margins from each
 * edge. If value passed as one of the insets value is kTFNoMetric then this value for margin is omitted.
 */
+ (NSArray *)tf_constraintsForView:(UIView *)view expandingEdgesToSuperviewWithInsets:(UIEdgeInsets)insets;

/*
 * Method returns array of width and/or height constraints for a view passed in view argument if one of the value is set to kTFNoMetric 
 * then constraint generation will be omitted for that metric.
 */
+ (NSArray *)tf_constraintsForView:(UIView *)view withSize:(CGSize)size;


@end
