LDProgressView (v. 1.1)
==============

A flat or gradient progress view with a simple color setter and customizable options written in pure Core Graphics.

![LDProgressView](https://dl.dropboxusercontent.com/u/20180054/Github%20Resources/LDProgressView/LDProgressView-1.1.gif)

# Changelog

### Version 1.1 released! (10/11/2013)
* New property: `borderRadius`
* New progress fill types: `LDProgressStripes` & `LDProgressGradient`

### Version 1.0 (09/30/2013)
* Initial release

# Install

## Manually
Download the zip of the project and put the classes `LDProgressView` and `UIColor+RGBValues` in your project. Then simply import "LDProgressView.h" in the file(s) you would like to use it in.

## CocoaPods
Add this to your Podfile: ```pod 'LDProgressView', '>= 1.1'```

To learn more about CocoaPods, please visit their [website](http://cocoapods.org).

# How To Use

Here are the examples as seen in the screenshot above:

```objc
// default color, animated
LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 130, self.view.frame.size.width-40, 22)];
progressView.progress = 0.40;
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

// flat, green, animated
progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 22)];
progressView.color = [UIColor colorWithRed:0.00f green:0.64f blue:0.00f alpha:1.00f];
progressView.flat = @YES;
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
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

// solid style, default color, not animated, no text, less border radius
progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 220, self.view.frame.size.width-40, 22)];
progressView.showText = @NO;
progressView.progress = 0.40;
progressView.borderRadius = @5;
progressView.type = LDProgressSolid;
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

// stripe style, no border radius, default color, not animated
progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 250, self.view.frame.size.width-40, 22)];
progressView.progress = 0.40;
progressView.borderRadius = @0;
progressView.type = LDProgressStripes;
progressView.color = [UIColor orangeColor];
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

```

You can also configure every LDProgressView using the UIAppearence protocol, which can be done in your app delegate. Here's a sample of this type of configuration:

```objc
[[LDProgressView appearance] setColor:[UIColor purpleColor]];
[[LDProgressView appearance] setFlat:@YES];
[[LDProgressView appearance] setAnimate:@YES];
[[LDProgressView appearance] setBorderRadius:@5];
```

# License (MIT)

Copyright (C) 2013 Light Design <lightdesigncoding@icloud.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
