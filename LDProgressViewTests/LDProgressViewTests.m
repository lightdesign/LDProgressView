//
//  LDProgressViewTeXCs.m
//  LDProgressViewTeXCs
//
//  Created by ChriXCian Di Lorenzo on 9/27/13.
//  Copyright (c) 2013 Light Design. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIColor+RGBValues.h"

@interface LDProgressViewTests : XCTestCase

@end

@implementation LDProgressViewTests

#pragma-mark - UIColor Category

- (void)testUIColorAccessMethods {
    UIColor *color = [UIColor colorWithRed:0.5 green:0.5 blue:0.6 alpha:1.0];
    XCTAssertEqual([color red], (CGFloat)0.5, @"red method should retrieve proper value");
    XCTAssertEqual([color green], (CGFloat)0.5, @"green method should retrieve proper value");
    XCTAssertEqual([color blue], (CGFloat)0.6, @"blue method should retrieve proper value");
    XCTAssertEqual([color alpha], (CGFloat)1.0, @"alpha method should retrieve proper value");
    XCTAssertTrue([color isLighterColor], @"highlight color should be darker if color's component average is above 0.5");
    
    color = [UIColor colorWithRed:0.5 green:0.45 blue:0.5 alpha:1.0];
    XCTAssertFalse([color isLighterColor], @"highlight color should be lighter if color's component average is below 0.5");
}

- (void)testUIColorDarkerMethod {
    float originalBrightness, darkerBrightness;
    UIColor *color = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    [color getHue:nil saturation:nil brightness:&originalBrightness alpha:nil];
    
    UIColor *darkerColor = [color darkerColor];
    [darkerColor getHue:nil saturation:nil brightness:&darkerBrightness alpha:nil];
    XCTAssertTrue(darkerBrightness < originalBrightness, @"darker color should lower the brightness");
    XCTAssertNotNil([[UIColor whiteColor] darkerColor], @"converting a white color to a darker color should not return nil");
    XCTAssertNotNil([[UIColor blackColor] darkerColor], @"converting a black color to a darker color should not return nil");
}

- (void)testUIColorLighterMethod {
    float originalBrightness, lighterBrightness;
    UIColor *color = [UIColor colorWithRed:0.2 green:0.33 blue:0.54 alpha:1.0];
    [color getHue:nil saturation:nil brightness:&originalBrightness alpha:nil];
    
    UIColor *lighterColor = [color lighterColor];
    [lighterColor getHue:nil saturation:nil brightness:&lighterBrightness alpha:nil];
    XCTAssertTrue(lighterBrightness > originalBrightness, @"lighter color should increase the brightness");
    XCTAssertNotNil([[UIColor whiteColor] lighterColor], @"converting a white color to a darker color should not return nil");
    XCTAssertNotNil([[UIColor blackColor] lighterColor], @"converting a black color to a darker color should not return nil");
}

@end
