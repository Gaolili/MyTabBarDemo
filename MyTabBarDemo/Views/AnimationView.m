//
//  AnimationView.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/11/2.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "AnimationView.h"



@interface AnimationView ()

@property (nonatomic, strong)UIView * ball_1;
@property (nonatomic, strong)UIView * ball_2;
@property (nonatomic, strong)UIView * ball_3;

@end

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
       
        UIVisualEffectView * bgView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        bgView.alpha = 0.6f;
        bgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:bgView];
        
        [self setUI];
        
    }
    return self;
}

- (void)setUI{
    CGFloat width = 20;
    CGFloat height = 20;
    CGFloat ball_radius = 20;
    CGFloat ball_y = 80;
    
    CGPoint centerPoint = CGPointMake(CGRectGetWidth(self.bounds)/2, (CGRectGetHeight(self.bounds)-20)/2);
    CGFloat centerX = centerPoint.x - ball_radius/2;
    
    UIView *ball_1 = [[UIView alloc]initWithFrame:CGRectMake(centerX - ball_radius, ball_y, width, height)];
    ball_1.backgroundColor = [UIColor blackColor];
    ball_1.layer.cornerRadius = width/2;
    ball_1.clipsToBounds = YES;
    self.ball_1 = ball_1;
    [self addSubview:ball_1];
    
    
    UIView * ball_2 = [[UIView alloc]initWithFrame:CGRectMake(centerX, ball_y, width , height)];
    ball_2.backgroundColor = [UIColor blackColor];
    ball_2.layer.cornerRadius = width/2;
    ball_2.clipsToBounds = YES;
    self.ball_2 = ball_2;
    [self addSubview:ball_2];
    
    
    UIView * ball_3 = [[UIView alloc]initWithFrame:CGRectMake(centerX + ball_radius, ball_y, width, height)];
    ball_3.backgroundColor = [UIColor blackColor];
    ball_3.layer.cornerRadius = width/2;
    ball_3.clipsToBounds = YES;
    self.ball_3 = ball_3;
    [self addSubview:ball_3];
    [self roationAnimation];
    
 }

- (void)roationAnimation{
    CGFloat ball_radius = 20;
    CGPoint centerPoint = CGPointMake(CGRectGetWidth(self.bounds)/2, (CGRectGetHeight(self.bounds)-20)/2);
    UIBezierPath * path_1=[UIBezierPath bezierPath];
    [path_1 moveToPoint:self.ball_1.center];
    [path_1 addArcWithCenter:centerPoint radius:ball_radius startAngle:M_PI endAngle:2*M_PI clockwise:NO];
    
    UIBezierPath * path_1_1 =[UIBezierPath bezierPath];
    [path_1_1  addArcWithCenter:centerPoint radius:ball_radius startAngle:0 endAngle:M_PI clockwise:NO];
    [path_1 appendPath:path_1_1];
    
    CAKeyframeAnimation * animation_ball_1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation_ball_1.path = path_1.CGPath;
    animation_ball_1.removedOnCompletion = NO;
    animation_ball_1.fillMode = kCAFillModeForwards;
    animation_ball_1.calculationMode = kCAAnimationCubic;
    animation_ball_1.repeatCount = 1;
    animation_ball_1.duration = 1.4;
    animation_ball_1.delegate = self;
    animation_ball_1.autoreverses = NO;
    animation_ball_1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.ball_1.layer addAnimation:animation_ball_1 forKey:@"animation"];
    
    
    UIBezierPath * path_3=[UIBezierPath bezierPath];
    [path_3 moveToPoint:self.ball_2.center];
    [path_3 addArcWithCenter:centerPoint radius:ball_radius startAngle:0 endAngle:M_PI clockwise:NO];
    
    UIBezierPath * path_3_3 =[UIBezierPath bezierPath];
    [path_3_3  addArcWithCenter:centerPoint radius:ball_radius startAngle:M_PI endAngle:2*M_PI clockwise:NO];
    [path_3 appendPath:path_3_3];
    
    CAKeyframeAnimation * animation_ball_3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation_ball_3.path = path_3.CGPath;
    animation_ball_3.removedOnCompletion = NO;
    animation_ball_3.fillMode = kCAFillModeForwards;
    animation_ball_3.calculationMode = kCAAnimationCubic;
    animation_ball_3.repeatCount = 1;
    animation_ball_3.duration = 1.4;
    animation_ball_3.autoreverses = NO;
    animation_ball_3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.ball_3.layer addAnimation:animation_ball_3 forKey:@"rotation"];
    
 }


- (void)animationDidStart:(CAAnimation *)anim{
    
    [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.ball_1.transform = CGAffineTransformMakeTranslation(-20, 0);
        self.ball_1.transform = CGAffineTransformScale(self.ball_1.transform, 0.7, 0.7);
        
        self.ball_3.transform = CGAffineTransformMakeTranslation(20, 0);
        self.ball_3.transform = CGAffineTransformScale(self.ball_3.transform, 0.7, 0.7);
        
        self.ball_2.transform = CGAffineTransformScale(self.ball_2.transform, 0.7, 0.7);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseIn  | UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.ball_1.transform = CGAffineTransformIdentity;
            self.ball_3.transform = CGAffineTransformIdentity;
            self.ball_2.transform = CGAffineTransformIdentity;
        } completion:NULL];
        
    }];
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self roationAnimation];
}
@end
