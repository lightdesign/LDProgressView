//
//  LDProgressView.h
//  LDProgressView
//
//  Created by Christian Di Lorenzo on 9/27/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDProgressView : UIView

@property (nonatomic) CGFloat progress;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *progressStripeColor;

@property (nonatomic) BOOL flat;
@property (nonatomic) BOOL animate;

@end
