//
//  ClearCacheTool.h
//  MyTabBarDemo
//
//  Created by gaolili on 15/11/19.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClearCacheTool : NSObject
@property (nonatomic, strong)NSString * pathFile;

- (CGFloat)folderSize;
- (void)clearCache;

@end
