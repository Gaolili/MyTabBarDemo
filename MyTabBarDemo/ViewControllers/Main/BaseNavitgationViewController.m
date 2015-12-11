//
//  BaseNavitgationViewController.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/12/11.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "BaseNavitgationViewController.h"

@interface BaseNavitgationViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)UIButton * backBtn;
@end

@implementation BaseNavitgationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"back_1"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"back_2"] forState:UIControlStateHighlighted];
        [_backBtn addTarget:self action:@selector(backBtnClickAction:) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
        _backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        _backBtn.frame = CGRectMake(0, 0, 44, 40);
        
     }
    return _backBtn;
}

- (void)backBtnClickAction:(UIButton *)btn{
    [self popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count>0) {
//        UIViewController * vc = self.childViewControllers[0];
//        if ( self.childViewControllers.count ==10) {
//            [_backBtn setTitle:vc.tabBarItem.title forState:UIControlStateNormal];
//        }else{
//            [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
//        }
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}


@end
