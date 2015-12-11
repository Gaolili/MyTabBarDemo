//
//  TwoViewController.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/28.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "TwoViewController.h"
#import "GLAlertView.h"

@interface TwoViewController ()<UITextViewDelegate>
@property (nonatomic, strong)UIButton * photoButton;
@property (nonatomic, strong)NSMutableArray * photos;
@property (nonatomic, strong)NSMutableArray * thumbs;

@end

@implementation TwoViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self popBtn]];
    self.navigationItem.title = @"two";
    
    self.photoButton.frame = CGRectMake(50, 100, 45, 30);
    [self.photoButton addTarget:self action:@selector(photoBUttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.photoButton];
 }


#pragma mark - 相册

- (UIButton *)photoButton{
    if (!_photoButton) {
        _photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_photoButton setTitle:@"相册" forState:UIControlStateNormal];
        _photoButton.backgroundColor = [UIColor blueColor];
    }
   
    return _photoButton;
}

- (void)photoBUttonClick{
    _photos = [NSMutableArray array];
    _thumbs = [NSMutableArray array];
    BOOL displayActionButton = YES;
    BOOL displaySelectionButtons = NO;
    BOOL displayNavArrows = NO;
    BOOL enableGrid = YES;
    BOOL startOnGrid = YES;
    BOOL autoPlayOnAppear = NO;
    
   
    [_photos addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=e321d3cd9e3df8dca6688795f8215ebd/7dd98d1001e93901b2d150047aec54e736d1963d.jpg"]]];
    
    [_photos addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://g.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=4b538424ae51f3dec3e7b162a4dedc27/500fd9f9d72a6059f368adf42934349b023bbae0.jpg"]]];
    
   
    [_thumbs addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=e321d3cd9e3df8dca6688795f8215ebd/7dd98d1001e93901b2d150047aec54e736d1963d.jpg"]]];
    
    [_thumbs addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://g.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=4b538424ae51f3dec3e7b162a4dedc27/500fd9f9d72a6059f368adf42934349b023bbae0.jpg"]]];
    
   // video
   MWPhoto * photo = [MWPhoto photoWithURL:[NSURL URLWithString:@"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=e321d3cd9e3df8dca6688795f8215ebd/7dd98d1001e93901b2d150047aec54e736d1963d.jpg"]];
  photo.videoURL = [[NSURL alloc] initWithString:@"http://v.jxvdy.com/sendfile/w5bgP3A8JgiQQo5l0hvoNGE2H16WbN09X-ONHPq3P3C1BISgf7C-qVs6_c8oaw3zKScO78I--b0BGFBRxlpw13sf2e54QA"];
    [_photos addObject:photo];
   MWPhoto * thumb = [MWPhoto photoWithURL:[NSURL URLWithString:@"http://d.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=e321d3cd9e3df8dca6688795f8215ebd/7dd98d1001e93901b2d150047aec54e736d1963d.jpg"]];
    thumb.videoURL =[[NSURL alloc] initWithString:@"http://v.jxvdy.com/sendfile/w5bgP3A8JgiQQo5l0hvoNGE2H16WbN09X-ONHPq3P3C1BISgf7C-qVs6_c8oaw3zKScO78I--b0BGFBRxlpw13sf2e54QA"];
    thumb.isVideo = YES;
    [_thumbs addObject:thumb];

    
    
    
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    browser.displayActionButton = displayActionButton;
    browser.displayNavArrows = displayNavArrows;
    browser.displaySelectionButtons = displaySelectionButtons;
    browser.alwaysShowControls = displaySelectionButtons;
    browser.zoomPhotosToFill = YES;
    browser.enableGrid = enableGrid;
    browser.startOnGrid = startOnGrid;
    browser.enableSwipeToDismiss = NO;
    browser.autoPlayOnAppear = autoPlayOnAppear;
    [browser setCurrentPhotoIndex:0];
    [self.navigationController pushViewController:browser animated:YES];
    
}


#pragma mark - MWPhotoBrowserDelegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return _photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < _photos.count)
        return [_photos objectAtIndex:index];
    return nil;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < _thumbs.count)
        return [_thumbs objectAtIndex:index];
    return nil;
}



#pragma mark - share
- (UIButton *)popBtn{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setImage:[UIImage imageNamed:@"share_1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)popBtnAction:(UIButton *)btn{
    
    GLAlertView * alertView = [[GLAlertView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2 -100, CGRectGetHeight(self.view.bounds) /2 -64, 200, 150) Title:@"提示" content:@"hello world ,good good study ,day day up" cancelBtn:@"取消" sureBtn:@"确定"];
    
    [alertView showFromDirection:NSAlertDirectionTop];
    
}
@end
