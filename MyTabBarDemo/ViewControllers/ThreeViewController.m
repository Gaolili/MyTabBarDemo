//
//  ThreeViewController.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/28.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "ThreeViewController.h"
#import "BottomView.h"
#import "RadarView.h"

@interface ThreeViewController ()
@property (nonatomic, strong)UISegmentedControl * segmentControl;

@end

@implementation ThreeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.titleView = self.segmentControl;
    
    RadarView * radarView = [[RadarView alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 250) circleArray:@[@"网站",@"安卓",@"ios",@"UI",@"金融",@"产品",@"行政",@"java",@"销售" ] ];
    [self.view addSubview:radarView];
    

    
    BottomView  *bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
     bottomView.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2,400);
    bottomView.titles = @"投递量";
    bottomView.progress = 0.5;
    bottomView.count = 13;
    [self.view addSubview:bottomView];
    
    
}



- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.segmentControl.frame =CGRectMake(100, 100, 180, 35);
}

- (UISegmentedControl *)segmentControl{
    if (!_segmentControl) {
       _segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"一键求职",@"职间"]];
        _segmentControl.selectedSegmentIndex = 0;
        _segmentControl.tintColor =[UIColor whiteColor];
        _segmentControl.layer.cornerRadius = 5;
        _segmentControl.layer.borderColor = [UIColor redColor].CGColor;
        _segmentControl.layer.borderWidth = 1.0f;
        _segmentControl.clipsToBounds = YES;
        _segmentControl.backgroundColor = __RGB(0x2499d9);
    }
    return _segmentControl;
}

@end
