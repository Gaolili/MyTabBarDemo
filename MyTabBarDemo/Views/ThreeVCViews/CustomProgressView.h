//
//  CustomProgressView.h
//  MyTabBarDemo
//
//  Created by gaolili on 15/11/18.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomProgressView : UIView
@property (nonatomic, assign)float progress;
@property (nonatomic, strong)UIColor * tintColors;
@property (nonatomic, strong)UIColor * trackgroundColors;

- (void)setProgress:(float)progress animate:(BOOL)animate;

@end
