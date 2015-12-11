//
//  AppDelegate.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/28.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "AppDelegate.h"
#import "leadPageViewController.h"
#import "MainTarBarViewController.h"
 
@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMainTabBarViewController) name:@"GL_ShowMainTabBarViewController" object:nil];
    
    [self setUpWindow];
    [self setShared];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}

- (void)setUpWindow{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController =[self starViewController];
    [self.window makeKeyAndVisible];

}


- (void)setShared{
    [UMSocialData setAppKey:UMKEY];
    [UMSocialWechatHandler setWXAppId:WXKEY appSecret:@"468ab73eef432f59a2aa5630e340862f" url:@"http://www.baidu.com"];
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatSession,UMShareToWechatTimeline]];
    
}


- (void)showMainTabBarViewController{
    MainTarBarViewController * tabbar = [[MainTarBarViewController alloc]init];
    self.window.rootViewController = tabbar;
 }


- (UIViewController *) starViewController{
    NSString * versionStr =@"CFBundleShortVersionString";
    NSString * currentVersion = [NSBundle mainBundle].infoDictionary[versionStr];
    NSString * oldVersion  = [[NSUserDefaults standardUserDefaults]objectForKey:versionStr];
    if (![currentVersion isEqualToString:oldVersion]) {
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:versionStr];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return [[leadPageViewController alloc]init];
    }
    MainTarBarViewController * mainTabBarVC = [[MainTarBarViewController alloc]init];
    _tabBarVC = mainTabBarVC;
    return mainTabBarVC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
