//
//  ShareTool.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/29.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "ShareTool.h"

@implementation ShareTool

+ (id)shareInstanced{
    static ShareTool * shareInstanced = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstanced = [[ShareTool alloc]init];
    });
    return shareInstanced;
}

- (void)shareToWeChatWithUrl:(NSString *)url shareTitle:(NSString *)title  content:(NSString *)content shareImage:(NSString*)shareImage{
    
    [self shareWithPlatform:@[UMShareToWechatSession] url:url shareTitle:title content:content shareImage:shareImage];
    
}

- (void)shareToWeChatFriendsWithUrl:(NSString *)url shareTitle:(NSString *)title  content:(NSString *)content shareImage:(NSString*)shareImage{
    
    [self shareWithPlatform:@[UMShareToWechatTimeline] url:url shareTitle:title content:content shareImage:shareImage];
}

- (void)shareWithPlatform:(NSArray *)platforms url:(NSString *)url shareTitle:(NSString *)title  content:(NSString *)content shareImage:(NSString*)shareImage{
    
    [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    UIImage * Image = [UIImage imageNamed:shareImage];
    UMSocialUrlResource * resource = [[UMSocialUrlResource alloc]initWithSnsResourceType:UMSocialUrlResourceTypeImage url:url];
    [[UMSocialDataService defaultDataService] postSNSWithTypes:platforms content:content image:Image location:nil urlResource:resource presentedController:nil completion:^(UMSocialResponseEntity *response) {
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功");
        }
    }];
}



@end
