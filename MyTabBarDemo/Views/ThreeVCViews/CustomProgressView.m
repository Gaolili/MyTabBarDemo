//
//  CustomProgressView.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/11/18.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "CustomProgressView.h"


@interface CustomProgressView ()
@property (nonatomic, strong)UIView  * progressView;
@end
@implementation CustomProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.tintColors = __RGB(0xf94700);
        self.trackgroundColors = __RGB(0xe5e8e8);
        self.backgroundColor = self.trackgroundColors;
        [self setUI];
     }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.tintColors = __RGB(0xf94700);
        self.trackgroundColors = __RGB(0xe5e8e8);
        self.backgroundColor = self.trackgroundColors;
        [self setUI];
    }
    return self;
}

- (void)setUI{
    _progressView = [[UIView alloc]init];
    _progressView.backgroundColor = self.tintColors;
    _progressView.layer.cornerRadius = 5;
    _progressView.clipsToBounds = YES;
    [self addSubview:_progressView];
}

- (void)setProgress:(float)progress{
    _progressView.frame = CGRectMake(0, 0, progress * CGRectGetWidth(self.bounds), self.size.height);
    CAGradientLayer * gradient = [CAGradientLayer layer];
    gradient.frame = _progressView.bounds;
    gradient.colors= @[(id)__RGB(0xff7c01).CGColor,(id)__RGB(0xf94700).CGColor];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    [_progressView.layer addSublayer:gradient];
    
}


- (void)setProgress:(float)progress animate:(BOOL)animate{
    _progressView.frame = CGRectZero;
    [UIView animateWithDuration:0.23 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
         _progressView.frame = CGRectMake(0, 0, progress * CGRectGetWidth(self.bounds), self.size.height);
    } completion:nil];
}

- (void)setTintColors:(UIColor *)tintColors {
    _tintColors = tintColors;
     _progressView.backgroundColor = _tintColors;
}

- (void)setTrackgroundColors:(UIColor *)trackgroundColors {
    _trackgroundColors = trackgroundColors;
    self.backgroundColor = _trackgroundColors;
}


@end
