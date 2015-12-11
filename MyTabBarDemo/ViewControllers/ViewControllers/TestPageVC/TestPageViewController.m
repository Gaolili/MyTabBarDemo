//
//  TestPageViewController.m
//  DoubiDemo
//
//  Created by gaolili on 15/12/11.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "TestPageViewController.h"
#import "OneTableViewController.h"
#import "TwoTableViewController.h"
#import "TThreeViewController.h"


@interface TestPageViewController ()

@end

@implementation TestPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"testPageVC";
    
    OneTableViewController * one = [[OneTableViewController alloc]init];
    TwoTableViewController * two = [[TwoTableViewController alloc]init];
    TThreeViewController * three =[[TThreeViewController alloc]init];
    self.viewControllers = @[one,two,three];
    [self showSegmentedControl];
    

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

-(void)pagerControllerSelectedIndex:(NSNotification *)notification
{
     [self setCurrentViewControllerAtIndex:0 animated:NO];
}

-(NSArray *)segementTitles
{
    return @[@"投资产品",@"预约产品",@"转让产品"];
}



@end
