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

#import "NSLayoutConstraint+TFLayoutConstraintsFactory.h"

@implementation NSLayoutConstraint (TFLayoutConstraintsFactory)

#pragma mark - Public Interface

+ (NSArray *)tf_horizontalAlignmentConstraintsForViews:(NSArray *)viewsArray separatorViews:(NSArray *)separatorsViewsArray margins:(CGFloat)margin {
    return [self tf_generateAlignmentConstraintForViews:viewsArray separatorViews:separatorsViewsArray horizontally:YES margins:margin];
}

+ (NSArray *)tf_verticalAlignmentConstraintsForViews:(NSArray *)viewsArray separatorViews:(NSArray *)separatorsViewsArray margins:(CGFloat)margin {
    return [self tf_generateAlignmentConstraintForViews:viewsArray separatorViews:separatorsViewsArray horizontally:NO margins:margin];
}

+ (NSArray *)tf_constraintsForView:(UIView *)view expandingEdgesToSuperviewWithInsets:(UIEdgeInsets)insets {
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    NSDictionary *insetsDictionary = @{@"top" : @(insets.top),
            @"bottom" : @(insets.bottom),
            @"left" : @(insets.left),
            @"right" : @(insets.right)};

    NSDictionary *viewDictionary = NSDictionaryOfVariableBindings(view);
    NSString *verticalTop = isnan(insets.top) ? @"" : [NSString stringWithFormat:@"|-%@-", @(insets.top).stringValue];
    NSString *verticalBottom = isnan(insets.bottom) ? @"" : [NSString stringWithFormat:@"-%@-|", @(insets.bottom).stringValue];

    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:%@[view]%@", verticalTop, verticalBottom]
                                                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                                                             metrics:insetsDictionary
                                                                               views:viewDictionary]];

    NSString *horizontalLeft = isnan(insets.left) ? @"" : [NSString stringWithFormat:@"|-%@-", @(insets.left).stringValue];
    NSString *horizontalRight = isnan(insets.right) ? @"" : [NSString stringWithFormat:@"-%@-|", @(insets.right).stringValue];

    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:%@[view]%@", horizontalLeft, horizontalRight]
                                                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                                                             metrics:insetsDictionary
                                                                               views:viewDictionary]];

    return [constraints copy];
}

+ (NSArray *)tf_constraintsForView:(UIView *)view withSize:(CGSize)size {
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    if (!isnan(size.width)) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1.0
                                                             constant:size.width]];
    }

    if (!isnan(size.height)) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:view
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1.0
                                                             constant:size.height]];
    }
    return [constraints copy];
}

+ (NSArray *)tf_centeringConstraintsForView:(UIView *)view
                             relativeToView:(UIView *)superview
                                    options:(TFCenteringOption)option
                                     offset:(CGPoint)offset {
    switch (option) {
        case TFCenteringOptionNone:
            return @[];
        case TFCenteringOptionAxisX:
            return @[[NSLayoutConstraint constraintWithItem:view
                                                  attribute:NSLayoutAttributeCenterX
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:superview
                                                  attribute:NSLayoutAttributeCenterX
                                                 multiplier:1.0
                                                   constant:isnan(offset.x) ? 0 : offset.x]];
        case TFCenteringOptionAxisY:
            return @[[NSLayoutConstraint constraintWithItem:view
                                                  attribute:NSLayoutAttributeCenterY
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:superview
                                                  attribute:NSLayoutAttributeCenterY
                                                 multiplier:1.0
                                                   constant:isnan(offset.y) ? 0 : offset.y]];
        case TFCenteringOptionAbsolute:
            return @[[NSLayoutConstraint constraintWithItem:view
                                                  attribute:NSLayoutAttributeCenterX
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:superview
                                                  attribute:NSLayoutAttributeCenterX
                                                 multiplier:1.0
                                                   constant:isnan(offset.x) ? 0 : offset.x],

                    [NSLayoutConstraint constraintWithItem:view
                                                 attribute:NSLayoutAttributeCenterY
                                                 relatedBy:NSLayoutRelationEqual
                                                    toItem:superview
                                                 attribute:NSLayoutAttributeCenterY
                                                multiplier:1.0
                                                  constant:isnan(offset.y) ? 0 : offset.y]];
        default:
            NSAssert(NO, @"Unrecognized option! For more information refer to the documentation");
            return nil;
    }
}

#pragma mark - Private Interface

+ (NSArray *)tf_generateAlignmentConstraintForViews:(NSArray *)viewsArray
                                     separatorViews:(NSArray *)separatorsViewsArray
                                       horizontally:(BOOL)isHorizontal
                                            margins:(CGFloat)margin {
    if (!viewsArray || !separatorsViewsArray) {
        return nil;
    }

    NSAssert(!(separatorsViewsArray.count < viewsArray.count - 1), ([NSString stringWithFormat:@"Method %s provided with too little separators views", sel_getName(_cmd)]));

    NSMutableDictionary *viewsDictionary = [[NSMutableDictionary alloc] init];
    NSString *constrainString = @"";
    for (int i = 0; i < viewsArray.count; ++i) {
        NSString *viewKey = [NSString stringWithFormat:@"view_%d", i];
        viewsDictionary[viewKey] = viewsArray[(NSUInteger) i];

        NSString *separatorKey = [NSString stringWithFormat:@"separator_%d", i];
        if (i < separatorsViewsArray.count) {
            viewsDictionary[separatorKey] = separatorsViewsArray[(NSUInteger) i];
        }

        if (i == 0) {
            constrainString = [NSString stringWithFormat:@"%@|-margin-[%@][%@]", isHorizontal ? @"H:" : @"V:", viewKey, separatorKey];
        } else if (i == viewsArray.count - 1) {
            constrainString = [NSString stringWithFormat:@"%@[%@]", constrainString, viewKey];
        } else {
            constrainString = [NSString stringWithFormat:@"%@[%@][%@(%@)]", constrainString, viewKey, separatorKey, @"separator_0"];
        }

        if (i == viewsArray.count - 1) {
            constrainString = [NSString stringWithFormat:@"%@-margin-|", constrainString];
        }
    }

    return [NSLayoutConstraint constraintsWithVisualFormat:constrainString
                                                   options:isHorizontal ? NSLayoutFormatAlignAllBottom : NSLayoutFormatAlignAllLeft
                                                   metrics:@{@"margin" : @(margin)}
                                                     views:viewsDictionary];
}

@end
