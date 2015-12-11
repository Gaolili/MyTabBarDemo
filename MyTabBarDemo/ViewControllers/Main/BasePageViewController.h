//
//  RightViewController.h
//  DoubiDemo
//
//  Created by gaolili on 15/12/1.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  BasePageViewController : UIViewController
{
@protected
    UIPageViewController* _pageViewController;
    NSArray* _viewControllers;
}

-(id)init;


@property(readonly, nonatomic)UIPageViewController* pageViewController;

@property(readwrite, nonatomic)NSArray* viewControllers;

-(void)showSegmentedControl;
-(void)hideSegmentedControl;

/**
 *  当需要重新获取配置时，调用这个方法，这个方法会重新检查例如pageScrollEnabled等方法，重新进行设定
 */
-(void)updateSettings;
/**
 *  需要时可以设置想要显示的viewController
 *
 *  @param index    显示viewController的index
 *  @param isBack   滚动的方向是否向后
 *  @param animated 是否需要滚动动画
 */
-(void)setCurrentViewControllerAtIndex:(NSInteger)index animated:(BOOL)animated;

-(NSArray *)segementTitles;

-(UIViewController *)currentViewController;

-(NSInteger)currentIndex;

#pragma mark - override points
#pragma mark settings
/**
 *  是否可以左右滑动，子类可以重写这个方法
 *
 *  @return 默认为YES
 */
-(BOOL)pageScrollEnabled;

-(NSInteger)numberOfSegmentControlItems;

-(UIImage*)imageOfSegmentControlAtIndex:(NSInteger)index;
-(UIImage*)highlightedImageOfSegmentControlAtIndex:(NSInteger)index;
-(NSString*)titleOfSegmentControlAtIndex:(NSInteger)index;

#pragma mark needs override
/**
 *  子类可以重写这个方法
 *
 *  @param pageViewController 当前的pageViewController
 *  @param index              跳转到的index
 *  @param previousIndex      跳转前的index
 */
-(void)pageViewController:(UIPageViewController *)pageViewController didScrollToPageIndex:(NSUInteger)index previousIndex:(NSUInteger)previousIndex;

//-(void)segmentControlDidSelectIndex:(NSInteger)index;
@end
