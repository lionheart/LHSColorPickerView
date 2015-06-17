//
//  LHSColorPickerView.m
//  Textshot+
//
//  Created by Eric Olszewski on 6/3/15.
//  Copyright (c) 2015 Lionheart Software LLC. All rights reserved.
//

#import "LHSColorPickerView.h"

#import <LHSCategoryCollection/UIView+LHSAdditions.h>

@implementation LHSColorPickerView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.layer.borderColor = [UIColor colorWithRed:(0.7) green:(0.7) blue:(0.7) alpha:0.7].CGColor;
        self.layer.borderWidth = 0.5;
        self.layer.cornerRadius = 10;
        [self setUserInteractionEnabled:YES];
        
        UIPanGestureRecognizer * recognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(updateColor:)];
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

- (void)updateColor:(UIPanGestureRecognizer *)gesture {
    float x = [gesture locationInView:self].x;
    float y = [gesture locationInView:self].y;
    
    float xRatio = x / self.frame.size.width;
    float yRatio = y / self.frame.size.height;
    float oneSeventh = 1.0 / 7.0;
    
    int red = 0;
    int green = 0;
    int blue = 0;
    
    if (xRatio < oneSeventh) {
        red = 255 * (1 - (yRatio));
        green = 255 * (1 - (xRatio * 7)) * (1 - (yRatio));
        blue = 255 * (1 - (xRatio * 7)) * (1 - (yRatio));
    }
    else if (xRatio < 2 * oneSeventh) {
        red = 255 * (1 - (yRatio));
        green = 255 * (7 * (xRatio - oneSeventh)) * (1 - (yRatio));
        blue = 0;
    }
    else if (xRatio < 3 * oneSeventh) {
        red = 255 * (1 - (7 * (xRatio - 2 * oneSeventh))) * (1 - (yRatio));
        green = 255 * (1 - (yRatio));
        blue = 0;
    }
    else if (xRatio < 4 * oneSeventh) {
        red = 0;
        green = 255 * (1 - (yRatio));
        blue = 255 * (7 * (xRatio - 3 * oneSeventh)) * (1 - (yRatio));
    }
    else if (xRatio < 5 * oneSeventh) {
        red = 0;
        green = 255 * (1 - (7 * (xRatio - 4 * oneSeventh))) * (1 - (yRatio));
        blue = 255 * (1 - (yRatio));
    }
    else if (xRatio < 6 * oneSeventh) {
        red = 255 * (7 * (xRatio - 5 * oneSeventh)) * (1 - (yRatio));
        green = 0;
        blue = 255 * (1 - (yRatio));
    }
    else {
        red = 255 * (1 - (yRatio));
        green = 0;
        blue = 255 * (1 - (7 * (xRatio - 6 * oneSeventh))) * (1 - (yRatio));
    }
    
    self.backgroundColor = [UIColor colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:1];
    
    [self.delegate didUpdateStyles:self];
}

@end