//
//  LDViewController.m
//  LDProgressView
//
//  Created by Christian Di Lorenzo on 9/27/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import "LDViewController.h"
#import "LDProgressView.h"

@interface LDViewController ()
@property (nonatomic, strong) NSMutableArray *progressViews;
@end

@implementation LDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progressViews = [NSMutableArray array];

    // default color, animated
    LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 130, self.view.frame.size.width-40, 22)];
    progressView.progress = 0.40;
    [self.progressViews addObject:progressView];
    [self.view addSubview:progressView];

    // flat, green, animated
    progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 22)];
    progressView.color = [UIColor colorWithRed:0.00f green:0.64f blue:0.00f alpha:1.00f];
    progressView.flat = @YES;
    progressView.showBackgroundInnerShadow = @NO;
    progressView.progress = 0.40;
    progressView.animate = @YES;
    [self.progressViews addObject:progressView];
    [self.view addSubview:progressView];

    // progress gradient, red, animated
    progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 190, self.view.frame.size.width-40, 22)];
    progressView.color = [UIColor colorWithRed:0.73f green:0.10f blue:0.00f alpha:1.00f];
    progressView.progress = 0.40;
    progressView.animate = @YES;
    progressView.type = LDProgressGradient;
    progressView.background = [progressView.color colorWithAlphaComponent:0.8];
    [self.progressViews addObject:progressView];
    [self.view addSubview:progressView];
    
    // solid style, default color, not animated, no text, less border radius
    progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 220, self.view.frame.size.width-40, 22)];
    progressView.color = [UIColor darkGrayColor];
    progressView.showText = @NO;
    progressView.progress = 0.40;
    progressView.borderRadius = @5;
    progressView.animate = @NO;
    progressView.type = LDProgressSolid;
    [self.progressViews addObject:progressView];
    [self.view addSubview:progressView];
    
    // stripe style, no border radius, default color, not animated
    progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 250, self.view.frame.size.width-40, 22)];
    progressView.progress = 0.40;
    progressView.borderRadius = @0;
    progressView.animate = @NO;
    progressView.type = LDProgressStripes;
    progressView.color = [UIColor orangeColor];
    [self.progressViews addObject:progressView];
    [self.view addSubview:progressView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, self.view.frame.size.width-40, 22)];
    label.text = @"Outline Progress Views";
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    
    // flat, green, no text, progress inset, outer stroke, solid
    progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 330, self.view.frame.size.width-40, 22)];
    progressView.color = [UIColor colorWithRed:0.00f green:0.64f blue:0.00f alpha:1.00f];
    progressView.flat = @YES;
    progressView.progress = 0.40;
    progressView.animate = @YES;
    progressView.showText = @NO;
    progressView.showStroke = @NO;
    progressView.progressInset = @5;
    progressView.showBackground = @NO;
    progressView.outerStrokeWidth = @3;
    progressView.type = LDProgressSolid;
    [self.progressViews addObject:progressView];
    [self.view addSubview:progressView];

    // flat, purple, progress inset, outer stroke, solid
    progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 360, self.view.frame.size.width-40, 22)];
    progressView.color = [UIColor purpleColor];
    progressView.flat = @YES;
    progressView.progress = 0.40;
    progressView.animate = @YES;
    progressView.showStroke = @NO;
    progressView.progressInset = @4;
    progressView.showBackground = @NO;
    progressView.outerStrokeWidth = @3;
    progressView.type = LDProgressSolid;
    [self.progressViews addObject:progressView];
    [self.view addSubview:progressView];

}
- (IBAction)changeValue:(UISegmentedControl *)sender {
    for (LDProgressView *progressView in self.progressViews) {
        progressView.progress = [[sender titleForSegmentAtIndex:sender.selectedSegmentIndex] floatValue]/100;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
