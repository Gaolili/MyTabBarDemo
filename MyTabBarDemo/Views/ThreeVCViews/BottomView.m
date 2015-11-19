//
//  BottomView.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/11/18.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "BottomView.h"
#import "CustomProgressView.h"

@interface BottomView ()
@property (nonatomic, strong)UILabel * titlesLabel;
@property (nonatomic, strong)CustomProgressView * progressView;
@property (nonatomic, strong)UIImageView * countImageView;
@property (nonatomic, strong)UILabel * countLabel;
@end

@implementation BottomView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    _titlesLabel = [[UILabel alloc]init];
    _titlesLabel.textAlignment = NSTextAlignmentCenter;
    _titlesLabel.textColor = [UIColor grayColor];
    _titlesLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_titlesLabel];
    
    _progressView = [[CustomProgressView alloc]init];
    [self addSubview:_progressView];
    
    _countImageView = [[UIImageView alloc]init];
    _countImageView.image = [UIImage imageNamed:@"key_bj"];
    [self addSubview:_countImageView];
    
    _countLabel = [[UILabel alloc]init];
    _countLabel.textColor = [UIColor grayColor];
    _countLabel.textAlignment = NSTextAlignmentCenter;
    [_countImageView addSubview:_countLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _titlesLabel.frame = CGRectMake(0, 0, 60, 30);
    _progressView.frame = CGRectMake(CGRectGetMaxX(_titlesLabel.frame) + 10, 10, 180, 10);
    _countImageView.frame = CGRectMake(CGRectGetMaxX(_progressView.frame) + 10, 5, 35, 25);
    _countLabel.frame = CGRectMake(5, 0, CGRectGetWidth(_countImageView.bounds) -10, CGRectGetHeight(_countImageView.bounds));
}

- (void)setTitles:(NSString *)titles{
    _titlesLabel.text = titles;
}

- (void)setProgress:(float)progress{
    _progressView.frame = CGRectMake(CGRectGetMaxX(_titlesLabel.frame) + 20, 10, 150, 10);
    _progressView.progress = progress;
}

- (void)setCount:(NSInteger)count{
    _countLabel.text = [NSString stringWithFormat:@"%d",count];
}

@end
