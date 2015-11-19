//
//  OneViewController.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/28.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "OneViewController.h"
#import "AnimationView.h"
#import "FiveViewController.h"
@implementation OneViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self shareBtn]];
    self.navigationItem.title = @"one";
    self.view.backgroundColor = [UIColor redColor];
    
    
    UIImageView * backImage = [[UIImageView alloc]initWithFrame:self.view.bounds];
    backImage.image = [UIImage imageNamed:@"backimg"];
    [self.view addSubview:backImage];
    
    AnimationView * animationView = [[AnimationView alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 200)];
    [self.view addSubview:animationView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushFiveVC) name:@"pushToFiveVC" object:nil];
    
}

- (void)pushFiveVC{
    FiveViewController *five = [[FiveViewController alloc]init];
    [self.navigationController pushViewController:five animated:YES];
}

- (UIButton *)shareBtn{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setImage:[UIImage imageNamed:@"share_1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)shareBtnAction:(UIButton *)btn{
    
    [[ShareTool shareInstanced] shareToWeChatWithUrl:@"https://www.baidu.com" shareTitle:@"测试" content:@"哈哈" shareImage:@"share"];
}
@end
