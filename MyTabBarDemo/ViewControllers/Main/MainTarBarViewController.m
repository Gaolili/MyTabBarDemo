//
//  MainTarBarViewController.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/28.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "MainTarBarViewController.h"
#import "BaseNavitgationViewController.h"
#import "KKNavigationController.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "TestPageViewController.h"

@interface MainTarBarViewController ()

@end

@implementation MainTarBarViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUpAllChildViewController];
}


- (void)setUpAllChildViewController{
    
    [self tabbarAddChildViewController:[[OneViewController alloc]init] title:@"丽丽" imageName:@"recommendation_1" selectedImage:@"recommendation_2"];
    [self tabbarAddChildViewController:[[TestPageViewController alloc]init] title:@"笨笨" imageName:@"broadwood_1" selectedImage:@"broadwood_2"];
    [self tabbarAddChildViewController:[[ThreeViewController alloc]init] title:@"加油" imageName:@"classification_1" selectedImage:@"classification_2"];
    [self tabbarAddChildViewController:[[FourViewController alloc]init] title:@"最棒" imageName:@"my_1" selectedImage:@"my_2"];
    
}

- (void)tabbarAddChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString*)imageName selectedImage:(NSString *)selectImage{
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    
    
    UIImage * imgSelect = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:imageName] selectedImage:imgSelect];
    vc.tabBarItem.title = title;
    vc.view.backgroundColor = [UIColor whiteColor];
    KKNavigationController * nav = [[KKNavigationController alloc]initWithRootViewController:vc];
    nav.navigationBar.translucent = NO;
    [self addChildViewController:nav];
}


 @end
