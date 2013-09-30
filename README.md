LDProgressView
==============

A flat or gradient progress view with a simple color setter and customizable options written in pure Core Graphics.

![LDProgressView](https://dl.dropboxusercontent.com/u/20180054/Github%20Resources/LD-progress-view-improved.png)

# Install
Coming soon... to a [CocoaPod](http://cocoapods.org) near you! :-)

# How To Use

Here are the three examples respectively as seen in the screenshot above:

```objc
// default color, animated
LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 130, self.view.frame.size.width-40, 22)];
progressView.progress = 0.40;
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

// green, not animated
progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 22)];
progressView.color = [UIColor colorWithRed:0.00f green:0.64f blue:0.00f alpha:1.00f];
progressView.progress = 0.40;
progressView.animate = @NO;
[self.view addSubview:progressView];

// flat, default color, animated
progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 190, self.view.frame.size.width-40, 22)];
progressView.color = [UIColor colorWithRed:0.73f green:0.10f blue:0.00f alpha:1.00f];
progressView.progress = 0.40;
progressView.flat = @YES;
[self.view addSubview:progressView];

```
