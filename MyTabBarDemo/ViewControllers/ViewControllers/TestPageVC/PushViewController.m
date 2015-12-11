//
//  PushViewController.m
//  DoubiDemo
//
//  Created by gaolili on 15/12/10.
//  Copyright © 2015年 mRocker. All rights reserved.
//


#import "PushViewController.h"

@interface PushViewController ()
@property (nonatomic, strong)UIButton * backBtn;
@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"pushVC";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
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
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
