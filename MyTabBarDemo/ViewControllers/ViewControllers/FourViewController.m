//
//  FourViewController.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/28.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "FourViewController.h"
#import "TestPageViewController.h"
#define Top_h 200
#define KScreen_Width  CGRectGetWidth([UIScreen mainScreen].bounds)
#define KScreen_Height CGRectGetHeight([UIScreen mainScreen].bounds)


@interface FourViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, strong)UIImageView * headImgView;
@end

@implementation FourViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    _tableView.contentInset = UIEdgeInsetsMake(Top_h, 0, 0, 0);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    self.headImgView.frame = CGRectMake(0, -Top_h, CGRectGetHeight([UIScreen mainScreen].bounds), Top_h);
    [_tableView addSubview:self.headImgView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _tableView.frame = self.view.bounds;
}

- (UIImageView *)headImgView{
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _headImgView.image = [UIImage imageNamed:@"BGimage"];
        
    }
    return _headImgView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat offsetX = (offsetY + Top_h) /2;
    if (offsetY < -Top_h) {
        CGRect frame = self.headImgView.frame;
        frame.origin.y = offsetY;
        frame.origin.x = offsetX;
        frame.size.height = - offsetY;
        frame.size.width = KScreen_Width + fabs(offsetX)*2;
        self.headImgView.frame = frame;
    }
    CGFloat alpha = (offsetY + Top_h) / Top_h;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor redColor] colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}




#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction * deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"delete");
    }];
    deleteRowAction.backgroundColor = [UIColor blueColor]; //自定义按钮的背景
    
    UITableViewRowAction * topRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"top" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"top");
    }];
    
    UITableViewRowAction * moreRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"more" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"more");
    }];
    
    // 返回多个按钮
    return @[deleteRowAction,topRowAction,moreRowAction];
    
}





@end
