//
//  leadPageViewController.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/28.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "leadPageViewController.h"

@interface leadPageViewController ()
@property (nonatomic, strong)UIButton * starBtn;
@end

@implementation leadPageViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.starBtn addTarget:self action:@selector(starBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.starBtn setTitle:@"开始" forState:UIControlStateNormal];
    [self.view addSubview:self.starBtn];
    
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.starBtn.frame = CGRectMake(60, CGRectGetHeight(self.view.bounds) - 80, CGRectGetWidth(self.view.bounds) - 120, 45);
}



- (void)starBtnAction:(UIButton *)btn{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GL_ShowMainTabBarViewController" object:nil];
}

- (UIButton *)starBtn{
    if (!_starBtn) {
        _starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _starBtn.layer.cornerRadius = 0.5;
        _starBtn.clipsToBounds = YES;
        _starBtn.layer.borderWidth = 0.5;
        _starBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        [_starBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _starBtn;
}

@end
