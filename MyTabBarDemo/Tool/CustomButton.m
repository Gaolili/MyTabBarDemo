//
//  CustomButton.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/12/22.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font  =[UIFont systemFontOfSize:14];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.center = CGPointMake(CGRectGetWidth(self.bounds)/2 - CGRectGetWidth(self.titleLabel.bounds)/2 , CGRectGetHeight(self.bounds)/2);
    self.imageView.center = CGPointMake(CGRectGetWidth(self.bounds)/2 + CGRectGetWidth(self.titleLabel.bounds)/2, CGRectGetHeight(self.bounds)/2);
}

@end
