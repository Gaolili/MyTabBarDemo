//
//  RightViewController.m
//  DoubiDemo
//
//  Created by gaolili on 15/12/1.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "BasePageViewController.h"

@interface  BasePageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
{
    UIScrollView __weak* _scrollView;
    UISegmentedControl * _segmentedControl;
    UIView             * _bottomView;
}
@end

@implementation BasePageViewController
@synthesize pageViewController = _pageViewController;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{UIPageViewControllerOptionInterPageSpacingKey:@(4)}];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
        
        _scrollView = [self aScrollViewOfView:_pageViewController.view];
        [self updateSettings];
    }
    return self;
}

-(void)updateSettings {
    _scrollView.scrollEnabled = [self pageScrollEnabled];
}

#pragma mark - settings
-(BOOL)pageScrollEnabled {
    return YES;
}

-(NSInteger)numberOfSegmentControlItems {
    return 0;
}

-(UIImage*)imageOfSegmentControlAtIndex:(NSInteger)index {
    return nil;
}

-(UIImage*)highlightedImageOfSegmentControlAtIndex:(NSInteger)index {
    return nil;
}

-(NSString *)titleOfSegmentControlAtIndex:(NSInteger)index {
    return nil;
}

/**
 *  获得某view的subviews中第一个scrollView
 */
-(UIScrollView*)aScrollViewOfView:(UIView*)view {
    for (UIView* v in [view subviews]) {
        if ([v isKindOfClass:[UIScrollView class]]) {
            return (UIScrollView*)v;
        } else {
            [self aScrollViewOfView:v];
        }
    }
    return nil;
}

-(void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = viewControllers;
    if (_viewControllers.count) {
        [_pageViewController setViewControllers:@[_viewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_pageViewController willMoveToParentViewController:self];
    [self addChildViewController:_pageViewController];
    _pageViewController.view.frame = self.view.bounds;
    [self.view addSubview:_pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
}

-(NSArray *)segementTitles{
    return nil;
}

-(UISegmentedControl*)aSegmentedControl {
    UISegmentedControl *segement = [[UISegmentedControl alloc]initWithItems:[self segementTitles]];
    //    segement.momentary = YES;
    segement.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds)  , 30);
    segement.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    segement.selectedSegmentIndex = 0;
    segement.tintColor = [UIColor blueColor];
    [segement addTarget:self action:@selector(didSelectedSegementIndex:) forControlEvents:UIControlEventValueChanged];
    return segement;
}

-(UIView *)customView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    
    if (!_segmentedControl) {
        _segmentedControl = [self aSegmentedControl];
        
        [view addSubview:_segmentedControl];
    }
    
    return view;
}

-(void)showSegmentedControl {
    
    if (!_bottomView) {
        _bottomView = [self customView];
        
        CGRect content,customView;
        CGRectDivide(self.view.bounds, &customView, &content, 45, CGRectMinYEdge);
        
        _bottomView.frame = customView;
        
        _segmentedControl.frame = UIEdgeInsetsInsetRect(customView, UIEdgeInsetsMake(0, 15, 10, 15));
        _pageViewController.view.frame = content;
        
        [self.view addSubview:_bottomView];
    }
}
-(void)hideSegmentedControl {
    [_segmentedControl removeFromSuperview];
    _pageViewController.view.frame = self.view.bounds;
}

-(UIViewController *)currentViewController {
    return [self.pageViewController.viewControllers firstObject];
}

-(NSInteger)currentIndex {
    return [[self viewControllers] indexOfObject:[self currentViewController]];
}

-(void)setCurrentViewControllerAtIndex:(NSInteger)index animated:(BOOL)animated{
    UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
    NSInteger currentIndex = [self currentIndex];
    if (currentIndex > index) {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    [_pageViewController setViewControllers:@[_viewControllers[index]] direction:direction animated:animated completion:NULL];
    [_segmentedControl setSelectedSegmentIndex:index];
}

#pragma mark - segmentedControl delegate
#pragma mark - segmentViewDelegate
-(void)didSelectedSegementIndex:(UISegmentedControl *)segment{
    [_pageViewController setViewControllers:@[_viewControllers[segment.selectedSegmentIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
}

#pragma mark - pageViewController Delegate
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger currentIndex = [_viewControllers indexOfObject:viewController];
    
    if ( currentIndex < [_viewControllers count]-1) {
        return [_viewControllers objectAtIndex:currentIndex+1];
    } else {
        return nil;
    }
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger currentIndex = [_viewControllers indexOfObject:viewController];
    
    if ( currentIndex > 0) {
        return [_viewControllers objectAtIndex:currentIndex-1];
    } else {
        return nil;
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        NSUInteger currentIndex = [_viewControllers indexOfObject:pageViewController.viewControllers[0]];
        NSUInteger previousIndex = [_viewControllers indexOfObject:previousViewControllers[0]];
        [self pageViewController:pageViewController didScrollToPageIndex:currentIndex previousIndex:previousIndex];
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController didScrollToPageIndex:(NSUInteger)index previousIndex:(NSUInteger)previousIndex {
    [_segmentedControl setSelectedSegmentIndex:index];
}

//-(void)segmentControlDidSelectIndex:(NSInteger)index {
//    [_segmentedControl setSelectedSegmentIndex:index];
//}

@end


