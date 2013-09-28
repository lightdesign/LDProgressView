//
//  LDProgressView.m
//  LDProgressView
//
//  Created by Christian Di Lorenzo on 9/27/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import "LDProgressView.h"
#import "UIColor+RGBValues.h"
#define STRIPE_WIDTH 50

@interface LDProgressView ()
@property (nonatomic) CGFloat offset;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation LDProgressView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.flat = NO;
    self.animate = YES;
    self.offset = 0;
    self.progress = 0.36;
    self.color = [UIColor colorWithRed:0.87f green:0.55f blue:0.09f alpha:1.00f];
}

- (void)setAnimate:(BOOL)animate {
    _animate = animate;
    if (animate) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(incrementOffset) userInfo:nil repeats:YES];
    } else if (self.timer) {
        [self.timer invalidate];
    }
}

- (void)incrementOffset {
    if (self.offset >= 0) {
        self.offset = -STRIPE_WIDTH;
    } else {
        self.offset += 1;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawProgressBackground:context inRect:rect];
    [self drawProgress:context withFrame:rect];
}

- (void)drawProgressBackground:(CGContextRef)context inRect:(CGRect)rect {
    CGContextSaveGState(context);
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10];
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.51f green:0.51f blue:0.51f alpha:1.00f].CGColor);
    [roundedRect fill];
    
    UIBezierPath *roundedRectangleNegativePath = [UIBezierPath bezierPathWithRect:CGRectMake(-10, -10, rect.size.width+10, rect.size.height+10)];
    [roundedRectangleNegativePath appendPath:roundedRect];
    roundedRectangleNegativePath.usesEvenOddFillRule = YES;

    CGSize shadowOffset = CGSizeMake(0.5, 1);
    CGContextSaveGState(context);
    CGFloat xOffset = shadowOffset.width + round(rect.size.width);
    CGFloat yOffset = shadowOffset.height;
    CGContextSetShadowWithColor(context,
            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)), 5, [[UIColor blackColor] colorWithAlphaComponent:0.7].CGColor);

    [roundedRect addClip];
    CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(rect.size.width), 0);
    [roundedRectangleNegativePath applyTransform:transform];
    [[UIColor grayColor] setFill];
    [roundedRectangleNegativePath fill];
    CGContextRestoreGState(context);
}

- (void)drawProgress:(CGContextRef)context withFrame:(CGRect)frame {
    CGRect rectToDrawIn = CGRectMake(0, 0, frame.size.width * self.progress, frame.size.height);
    CGRect insetRect = CGRectInset(rectToDrawIn, 0.5, 0.5);
    
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:10];
    if (self.flat) {
        CGContextSetFillColorWithColor(context, self.color.CGColor);
        [roundedRect fill];
    } else {
        CGContextSaveGState(context);
        [roundedRect addClip];
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGFloat locations[] = {0.0, 1.0};
        NSArray *colors = @[(__bridge id)[self.color lighterColor].CGColor, (__bridge id)[self.color darkerColor].CGColor];
        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
        
        CGContextClip(context);
        CGContextDrawLinearGradient(context, gradient, CGPointMake(insetRect.size.width / 2, 0), CGPointMake(insetRect.size.width / 2, insetRect.size.height), 0);
        CGContextRestoreGState(context);
        
        CGGradientRelease(gradient);
        CGColorSpaceRelease(colorSpace);
    }
    
    CGContextSetStrokeColorWithColor(context, [[self.color darkerColor] darkerColor].CGColor);
    [self drawStripes:context inRect:insetRect];
    [roundedRect stroke];
    
    [self drawRightAlignedLabelInRect:insetRect];
}

- (void)drawStripes:(CGContextRef)context inRect:(CGRect)rect {
    CGContextSaveGState(context);
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10] addClip];
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] colorWithAlphaComponent:0.2].CGColor);
    CGFloat xStart = self.offset, height = rect.size.height, width = STRIPE_WIDTH;
    while (xStart < rect.size.width) {
        CGContextSaveGState(context);
        CGContextMoveToPoint(context, xStart, height);
        CGContextAddLineToPoint(context, xStart + width * 0.25, 0);
        CGContextAddLineToPoint(context, xStart + width * 0.75, 0);
        CGContextAddLineToPoint(context, xStart + width * 0.50, height);
        CGContextClosePath(context);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
        xStart += width;
    }
    CGContextRestoreGState(context);
}

- (void)drawRightAlignedLabelInRect:(CGRect)rect {
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentRight;
    label.text = [NSString stringWithFormat:@"%.0f%%", self.progress*100];
    label.font = [UIFont boldSystemFontOfSize:17];
    label.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    [label drawTextInRect:CGRectOffset(rect, -6, 0)];
}

@end
