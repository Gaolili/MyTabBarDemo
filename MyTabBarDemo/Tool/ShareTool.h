//
//  ShareTool.h
//  MyTabBarDemo
//
//  Created by gaolili on 15/10/29.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareTool : NSObject

+ (id)shareInstanced;

- (void)shareToWeChatWithUrl:(NSString *)url shareTitle:(NSString *)title  content:(NSString *)content shareImage:(NSString*)shareImage;

- (void)shareToWeChatFriendsWithUrl:(NSString *)url shareTitle:(NSString *)title  content:(NSString *)content shareImage:(NSString*)shareImage;
@end
