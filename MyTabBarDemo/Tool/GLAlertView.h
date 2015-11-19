//
//  GLAlertView.h
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/29.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , NSAlertDirectionType) {
    NSAlertDirectionTop =0,
    NSAlertDirectionBottom,
    NSAlertDirectionLeft,
    NSAlertDirectionRight
};

@interface GLAlertView : UIView

- (id)initWithFrame:(CGRect)frame Title:(NSString *)title content:(NSString *)content cancelBtn:(NSString *)cancelTitle sureBtn:(NSString *)sureTitle;

// 默认从上弹出
- (void)show;

/** 提示框弹出的方向， 从上，下，左，右四个方向 */
- (void)showFromDirection:(NSAlertDirectionType)direction;

- (void)hide;
@end
