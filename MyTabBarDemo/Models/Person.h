//
//  Person.h
//  MyTabBarDemo
//
//  Created by gaolili on 15/11/16.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, strong)NSString  * name;
@property (nonatomic, strong)NSString  * address;
@property (nonatomic, assign)NSInteger   age;

@end
