//
//  LHSColorPickerView.h
//  Textshot+
//
//  Created by Eric Olszewski on 6/3/15.
//  Copyright (c) 2015 Lionheart Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LHSColorPickerViewDelegate <NSObject>

- (void)didUpdateStyles:(id)sender;

@end

@interface LHSColorPickerView : UIView

@property (nonatomic, weak) id<LHSColorPickerViewDelegate> delegate;
@property (nonatomic, strong) UIColor *customColor;
@property (nonatomic, strong) NSString *itemToBeModified;

@end
