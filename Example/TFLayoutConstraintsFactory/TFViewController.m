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

#import "TFViewController.h"
#import "NSLayoutConstraint+TFLayoutConstraintsFactory.h"

@interface TFViewController ()

@end

@implementation TFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView *redView = [[UIView alloc] init];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(100)]" 
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing 
                                                                      metrics:nil views:NSDictionaryOfVariableBindings(redView)]];
    [self.view addConstraints:[NSLayoutConstraint tf_constraintsForView:redView expandingEdgesToSuperviewWithInsets:UIEdgeInsetsMake(20, kTFNoInsetMetric, 10, 30)]];
    UILabel *l1 = [[UILabel alloc] init];
    l1.translatesAutoresizingMaskIntoConstraints = NO;
    l1.text = @"1";
    l1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:l1];

    UILabel *l2 = [[UILabel alloc] init];
    l2.translatesAutoresizingMaskIntoConstraints = NO;
    l2.text = @"2";
    l2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:l2];

    UILabel *l3 = [[UILabel alloc] init];
    l3.translatesAutoresizingMaskIntoConstraints = NO;
    l3.text = @"3";
    l3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:l3];

    UILabel *l4 = [[UILabel alloc] init];
    l4.translatesAutoresizingMaskIntoConstraints = NO;
    l4.text = @"4";
    l4.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:l4];

    UIView *sep1 = [[UIView alloc] init];
    sep1.translatesAutoresizingMaskIntoConstraints = NO;
    sep1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:sep1];

    UIView *sep2 = [[UIView alloc] init];
    sep2.translatesAutoresizingMaskIntoConstraints = NO;
    sep2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sep2];

    UIView *sep3 = [[UIView alloc] init];
    sep3.translatesAutoresizingMaskIntoConstraints = NO;
    sep3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sep3];

    UIView *view = l1;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-40-|" options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    
    [self.view addConstraints:[NSLayoutConstraint tf_horizontalAlignmentConstraintsForViews:@[l1, l2, l3, l4]
                                                                           separatorViews:@[sep1, sep2, sep3]
                                                                                  margins:15]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
