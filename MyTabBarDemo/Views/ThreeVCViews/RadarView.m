//
//  LeiDaView.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/11/17.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "RadarView.h"


@interface RadarView ()
@property (nonatomic, strong)NSArray * circleTitleArray; // 小圆圈的文字
@property (nonatomic, strong)NSMutableArray * circleMutArray; // 小圆圈
@property (nonatomic, strong)UIButton * centerBtn;
@property (nonatomic, strong)UIImageView * circleImageView;
@property (nonatomic, strong)UIView * line;
@property (nonatomic, assign)NSInteger count;
@property (nonatomic, strong)NSTimer *timer;
@end

@implementation RadarView
- (instancetype)initWithFrame:(CGRect)frame circleArray:(NSArray*)circleArray{
    self = [super initWithFrame:frame];
    if (self) {
        _circleTitleArray = circleArray;
        _circleMutArray = [NSMutableArray array];
        [self setUI];
    }
    return self;
}

- (void)setUI{
    _circleImageView = [[UIImageView alloc]init];
    _circleImageView.image = [UIImage imageNamed:@"radar"];
    [self addSubview:_circleImageView];
    
    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _centerBtn.backgroundColor = __RGB(0x2499d9);
    _centerBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_centerBtn setTitle:@"开始匹配" forState:UIControlStateNormal];
    [_centerBtn addTarget:self action:@selector(starScanAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_centerBtn];
    
   for (NSString * str in _circleTitleArray) {
        UIButton * littleC = [self customLittleCircleWithTitle:str];
        [_circleImageView addSubview:littleC];
        [_circleMutArray addObject:littleC];
    }
    
    _line =[[UIView alloc]init];
    [_circleImageView addSubview:_line];
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGPoint center =CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
    
    _circleImageView.frame =CGRectMake(0, 0, CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds));
    _circleImageView.center =center;
    
    CGFloat centerBtnW =60 * (CGRectGetWidth([UIScreen mainScreen].bounds)/ 375);
    _centerBtn.frame = CGRectMake(0, 0, centerBtnW, centerBtnW);
    _centerBtn.center = center;
    _centerBtn.layer.cornerRadius = centerBtnW/2;
    _centerBtn.clipsToBounds = YES;
    
    
 
    CGFloat btnW =40 * (CGRectGetWidth([UIScreen mainScreen].bounds)/ 375);
    CGPoint circleCenter = CGPointMake(CGRectGetWidth(_circleImageView.bounds)/2, CGRectGetHeight(_circleImageView.bounds)/2);
    
    
    _line.frame = CGRectMake(circleCenter.x, 0, 2, CGRectGetHeight(_circleImageView.bounds));
    
    CAGradientLayer * gradient = [CAGradientLayer layer];
    gradient.frame = _line.bounds;
    gradient.startPoint = CGPointMake(0, 1);
    gradient.endPoint = CGPointMake(0, 0);
    gradient.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                        (__bridge id)__RGB(0x2499d9).CGColor];
    gradient.locations = @[@(0.5f),@(0.1f)];
    [_line.layer addSublayer:gradient];
    
    for (int i=0 ; i<_circleMutArray.count ;i++) {
        UIButton * btn =_circleMutArray[i];
        if (i==0){
            btn.frame = CGRectMake(CGRectGetWidth(_circleImageView.bounds) - 80,  circleCenter.y - 20 , btnW, btnW);
        }else if (i ==1){
          btn.frame = CGRectMake(CGRectGetWidth(_circleImageView.bounds) - 40, circleCenter.y - 80, btnW, btnW);
        }else if (i ==2){
            btn.frame = CGRectMake(circleCenter.x + 60, center.y + 25, btnW, btnW);
        }else if ( i ==3){
            btn.frame = CGRectMake(circleCenter.x - btnW/2 , 15, btnW, btnW); //java
        }else if ( i ==4){
            btn.frame = CGRectMake(20, 20, btnW, btnW);
        }else if (i ==5){
            btn.frame = CGRectMake(circleCenter.x - 80, circleCenter.y - btnW/2 , btnW, btnW);
        }else if (i ==6){
            btn.frame = CGRectMake(5, circleCenter.y + 40, btnW, btnW);
        }else if (i ==7){
            btn.frame = CGRectMake(80, circleCenter.y + 65 , btnW, btnW);
        }else {
            btn.frame = CGRectMake(160, circleCenter.y + 85, btnW, btnW);
        }
        btn.layer.cornerRadius = btnW/2;
        btn.clipsToBounds = YES;
       
      }
 }


- (void)starScanAction:(UIButton *)btn{
   [_centerBtn setTitle:@"匹配中" forState:UIControlStateNormal];

    CGFloat angle =M_PI_4  ;
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: angle ];
    rotationAnimation.duration = 1;
    rotationAnimation.delegate = self;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 5;
    [_line.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}

- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"star");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    
    [CATransaction commit];
    
}

- (UIButton *)customLittleCircleWithTitle:(NSString *)title{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = __RGB(0xe5e8e8);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    return btn;
}
@end
