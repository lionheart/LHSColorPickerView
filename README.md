# LHSColorPickerView

[![CI Status](http://img.shields.io/travis/Eric Olszewski/LHSColorPickerView.svg?style=flat)](https://travis-ci.org/Eric Olszewski/LHSColorPickerView)
[![Version](https://img.shields.io/cocoapods/v/LHSColorPickerView.svg?style=flat)](http://cocoapods.org/pods/LHSColorPickerView)
[![License](https://img.shields.io/cocoapods/l/LHSColorPickerView.svg?style=flat)](http://cocoapods.org/pods/LHSColorPickerView)
[![Platform](https://img.shields.io/cocoapods/p/LHSColorPickerView.svg?style=flat)](http://cocoapods.org/pods/LHSColorPickerView)

This view is a quick and easy way to let users of your app choose a color. The larger you make this view, the more colors a user will be able to choose. Here's what three of these look like in [Textshot+](https://itunes.apple.com/us/app/textshot+/id958189016?ls=1&mt=8).

<p align="center">
  <img src="http://i.imgur.com/BOBMp89.gif"/>
</p>
## Usage

Integrating LHSColorPickerView into your project is pretty straightforward. You just need to instantiate the view, assign a delegate, and then define the required methods in your delegate.

Here's how I implemented this in the above application, [Textshot+](https://itunes.apple.com/us/app/textshot+/id958189016?ls=1&mt=8).

#Necessary import and protocol for LHSColorPickerView

```objc
#import <LHSColorPickerView/LHSColorPickerView.h>

...

@interface TXSStyleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, LHSColorPickerViewDelegate>
```

Setting up three equally-spaced views inside of a UITableViewCell. Feel free to make these views as large or small as you want.

```objc
// This is used to get the previously stored color for each of these color pickers
TXSSettings *settings = [TXSSettings sharedSettings];
UIView *colorPickerView = [[UIView alloc] init];
colorPickerView.translatesAutoresizingMaskIntoConstraints = NO;

LHSColorPickerView *textColorPickerView = [[LHSColorPickerView alloc] init];
textColorPickerView.itemToBeModified = @"Text";
textColorPickerView.delegate = self;
textColorPickerView.translatesAutoresizingMaskIntoConstraints = NO;
textColorPickerView.backgroundColor = settings.customTextColor;
[colorPickerView addSubview:textColorPickerView];

LHSColorPickerView *backgroundColorPickerView = [[LHSColorPickerView alloc] init];
backgroundColorPickerView.itemToBeModified = @"Background";
backgroundColorPickerView.delegate = self;
backgroundColorPickerView.translatesAutoresizingMaskIntoConstraints = NO;
backgroundColorPickerView.backgroundColor = settings.customBackgroundColor;
[colorPickerView addSubview:backgroundColorPickerView];

LHSColorPickerView *headerColorPickerView = [[LHSColorPickerView alloc] init];
headerColorPickerView.itemToBeModified = @"Header";
headerColorPickerView.delegate = self;
headerColorPickerView.translatesAutoresizingMaskIntoConstraints = NO;
headerColorPickerView.backgroundColor = settings.customHeaderColor;
[colorPickerView addSubview:headerColorPickerView];
                    
UIView *spacer1 = [[UIView alloc] init];
spacer1.translatesAutoresizingMaskIntoConstraints = NO;
[colorPickerView addSubview:spacer1];

UIView *spacer2 = [[UIView alloc] init];
spacer2.translatesAutoresizingMaskIntoConstraints = NO;
[colorPickerView addSubview:spacer2];

[cell.contentView addSubview:colorPickerView];

CGFloat width = CGRectGetWidth(cell.contentView.frame);
                    
NSDictionary *metrics = @{
                          @"pickerWidth": @(width / 4),
                          @"margin": @(15)
                          };


NSDictionary *views = @{
                        @"colorPickerView": colorPickerView,
                        @"textColorPickerView": textColorPickerView,
                        @"headerColorPickerView": headerColorPickerView,
                        @"backgroundColorPickerView": backgroundColorPickerView,
                        @"spacer1": spacer1,
                        @"spacer2": spacer2
                        };

[cell.contentView lhs_addConstraints:@"V:|-(margin)-[colorPickerView]" metrics:metrics views:views];
[UIView lhs_addConstraints:@"H:|-(margin)-[view]-(margin)-|" metrics:metrics views:@[colorPickerView]];
[colorPickerView lhs_addConstraints:@"H:|[textColorPickerView(pickerWidth)][spacer1][backgroundColorPickerView(==textColorPickerView)][spacer2(==spacer1)][headerColorPickerView(==textColorPickerView)]|" metrics:metrics views:views];
[UIView lhs_addConstraints:@"V:|[view(pickerWidth)]|" metrics:metrics views:@[textColorPickerView, headerColorPickerView, backgroundColorPickerView]];
cell.selectionStyle = UITableViewCellSelectionStyleNone;
[cell.contentView updateConstraintsIfNeeded];

```

It is necessary to implement a didUpdateStyles method in the delegate as this is what wil be called whenever a user interacts with an LHSColorPickerView

```objc
#pragma mark - TXSColorPickerViewDelegate

- (void)didUpdateStyles:(LHSColorPickerView *)sender {
    if ([sender.itemToBeModified isEqualToString:@"Text"]) {
        [TXSSettings sharedSettings].customTextColor = sender.backgroundColor;
    }
    else if ([sender.itemToBeModified isEqualToString:@"Background"]) {
        [TXSSettings sharedSettings].customBackgroundColor = sender.backgroundColor;
    }
    else {
        [TXSSettings sharedSettings].customHeaderColor = sender.backgroundColor;
    }
    [self.delegate didUpdateStyles:self];
}
```

## Requirements

You will not have any issues if you are building for iOS 7 or higher.

## Installation

LHSColorPickerView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LHSColorPickerView"
```

## Author

Eric Olszewski, eric@lionheartsw.com

## License

LHSColorPickerView is available under the Apache 2.0 license. See the LICENSE file for more info.



