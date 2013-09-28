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

@end

@implementation LDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 22)];
    progressView.color = [UIColor colorWithRed:0.87f green:0.55f blue:0.09f alpha:1.00f];
    progressView.progress = 0.36;
    [self.view addSubview:progressView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
