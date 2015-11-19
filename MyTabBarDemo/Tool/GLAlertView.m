//
//  GLAlertView.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/29.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "GLAlertView.h"

@interface GLAlertView (){
    NSString * _titleStr;
    NSString * _contentStr;
    NSString * _cancelStr;
    NSString * _sureStr;
    
    
    UIView  * _alerView;
    CGRect   _alertFrame;
    UILabel * _titleLabel;
    UILabel * _contentLabel;
    UIButton * _cancelBtn;
    UIButton * _sureBtn;
}

@end

@implementation GLAlertView

- (id)initWithFrame:(CGRect)frame Title:(NSString *)title content:(NSString *)content cancelBtn:(NSString *)cancelTitle sureBtn:(NSString *)sureTitle{
    self = [super init];
    if (self) {
        _alertFrame = frame;
        _titleStr = title;
        _contentStr = content;
        _cancelStr = cancelTitle;
        _sureStr = sureTitle;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    
    _alerView = [[UIView alloc]init];
    _alerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_alerView];
    _titleLabel = [self customLabelWithText:_titleStr];
    [_alerView addSubview:_titleLabel];
    _contentLabel = [self customLabelWithText:_contentStr];
    [_alerView addSubview:_contentLabel];
    
    _cancelBtn = [self customBtnWithTitle:_cancelStr];
    [_cancelBtn addTarget:self action:@selector(cancelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_alerView addSubview:_cancelBtn];
    _sureBtn = [self customBtnWithTitle:_sureStr];
    [_alerView addSubview:_sureBtn];
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.frame = [UIScreen mainScreen].bounds;
    _titleLabel.frame = CGRectMake(0, 10, CGRectGetWidth(_alerView.bounds), 30);
    _contentLabel.frame = CGRectMake(0, 40, CGRectGetWidth(_alerView.bounds), 60);
    _cancelBtn.frame = CGRectMake(30, CGRectGetMaxY(_contentLabel.frame) + 10, 60, 30);
    _sureBtn.frame = CGRectMake(CGRectGetMaxX(_cancelBtn.frame) + 20, CGRectGetMaxY(_contentLabel.frame) + 10, 60, 30);
   
    
 }


- (void)show{
    
    [self showFromDirection:NSAlertDirectionTop];
    
}


- (void)showFromDirection:(NSAlertDirectionType)direction{
    self.frame = [UIScreen mainScreen].bounds;
    UIViewController * topViewController = [self appRootViewController];
    [topViewController.view addSubview:self];
    self.backgroundColor = [UIColor colorWithWhite:0.448 alpha:0.600];
    
   switch (direction) {
        case NSAlertDirectionTop:
        {
            CGRect frame = _alertFrame;
            frame.origin.y = - frame.origin.y;
            _alerView.frame =frame;
            
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                _alerView.y =_alertFrame.origin.y;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    _alerView.y -=50;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        _alerView.y +=50;
                    } completion:^(BOOL finished) {
                    }];
                }];
            }];
            
         }break;
        case NSAlertDirectionBottom:
        {
             CGRect frame = _alertFrame;
            frame.origin.y = CGRectGetHeight(self.bounds);
            _alerView.frame = frame;
            
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                _alerView.y =_alertFrame.origin.y;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    _alerView.y +=30;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        _alerView.y -=30;
                    } completion:^(BOOL finished) {
                    }];
                }];
            }];
            
            
        }break;
        case NSAlertDirectionLeft:
        {
            CGRect frame = _alertFrame;
            frame.origin.x = - frame.origin.x - frame.size.width;
            _alerView.frame = frame;
            
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                _alerView.x =CGRectGetWidth(self.bounds) - _alertFrame.size.width;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    _alerView.x -=_alertFrame.size.width;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        _alerView.x +=_alertFrame.size.width/2;
                    } completion:^(BOOL finished) {
                        _alerView.x = _alertFrame.origin.x;
                        
                    }];
                }];
            }];
            
        }break;
        case NSAlertDirectionRight:
        {
            CGRect frame = _alertFrame;
            frame.origin.x = CGRectGetWidth(self.bounds);
            _alerView.frame = frame;
            
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                _alerView.x =_alertFrame.origin.x;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    _alerView.x -=30;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        _alerView.x  +=20;
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            _alerView.x  +=5;
                        } completion:^(BOOL finished) {
                            
                        }];
                     }];
                }];
            }];
            
        } break;
        default:
            break;
    }
 }


- (void)hide{
    CGPoint point =self.center;
    point.y = CGRectGetHeight(self.bounds);
  [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _alerView.y += 30;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
           _alerView.y = CGRectGetHeight(self.bounds);
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hide];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = _alerView.frame;
    if (CGRectContainsPoint(rect, point)) {
        return nil;
    }
    [super hitTest:point withEvent:event];
    return self;
}


- (void)cancelBtnAction:(UIButton *)btn{
    [self hide];
}

- (UIViewController *)appRootViewController{
    UIViewController * appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController * topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}


- (UILabel *)customLabelWithText:(NSString *)content{
    UILabel * lab = [[UILabel alloc]init];
    lab.text = content;
    lab.numberOfLines = 0;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:14];
    return lab;
}


- (UIButton *)customBtnWithTitle:(NSString *)title{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.text = title;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return btn;
}
@end
