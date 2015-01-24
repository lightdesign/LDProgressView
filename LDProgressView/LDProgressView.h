//
//  LDProgressView.h
//  LDProgressView
//
//  Created by Christian Di Lorenzo on 9/27/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LDProgressStripes,
    LDProgressGradient,
    LDProgressSolid
} LDProgressType;

typedef enum {
    LDAnimateDirectionForward,
    LDAnimateDirectionBackward
} LDAnimateDirection;

@interface LDProgressView : UIView

@property (nonatomic) CGFloat progress;
@property (nonatomic) CGFloat labelProgress;

@property (nonatomic, strong) UIColor *color UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor *background UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) NSNumber *flat UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) NSNumber *animate UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) NSNumber *showStroke UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) NSNumber *showText UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) NSNumber *showBackground UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) NSNumber *showBackgroundInnerShadow UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) NSNumber *outerStrokeWidth UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) NSNumber *progressInset UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) NSNumber *borderRadius UI_APPEARANCE_SELECTOR;

@property (nonatomic) NSTextAlignment textAlignment;
@property (nonatomic) LDProgressType type;
@property (nonatomic) LDAnimateDirection animateDirection;

- (void)overrideProgressText:(NSString *)progressText;
- (void)overrideProgressTextColor:(UIColor *)progressTextColor;

@end
