//
//  ClearCacheTool.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/11/19.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "ClearCacheTool.h"

@implementation ClearCacheTool
// 文件夹大小
- (CGFloat)folderSize{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 默认系统缓存地址 [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *cachesDirectory = _pathFile;
    if (![fileManager fileExistsAtPath:cachesDirectory]) {
        return 0;
    }
    NSEnumerator *chileFiles = [[fileManager subpathsAtPath:cachesDirectory] objectEnumerator];
    NSString * fileName;
    long long folderSize =0;
    while ((fileName = [chileFiles nextObject])!=nil) {
        NSString * fileAbsolutePath =[cachesDirectory stringByAppendingFormat:@"/%@",fileName];
        folderSize +=[self fileSizePath:fileAbsolutePath];
    }
    return folderSize/(1000.0*1000.0);
}

// 文件大小
-(long long)fileSizePath:(NSString *)filePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        return [[fileManager attributesOfItemAtPath:filePath error:nil]fileSize];
    }
    return 0;
}

// 清除缓存
- (void)clearCache{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachesDirectory =_pathFile;
    if (![fileManager fileExistsAtPath:cachesDirectory]) {
        return ;
    }
    NSEnumerator *chileFiles = [[fileManager subpathsAtPath:cachesDirectory] objectEnumerator];
    NSString * fileName;
    while ((fileName = [chileFiles nextObject])!=nil) {
        NSLog(@"清除中...");
        NSString * fileAbsolutePath =[cachesDirectory stringByAppendingFormat:@"/%@",fileName];
        [fileManager removeItemAtPath:fileAbsolutePath error:nil];
    }
    NSLog(@"清除成功");
    
}



@end
