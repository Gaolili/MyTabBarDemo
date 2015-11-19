//
//  Person.m
//  MyTabBarDemo
//
//  Created by gaolili on 15/11/16.
//  Copyright © 2015年 mRocker. All rights reserved.
//

#import "Person.h"

@implementation Person

//解码
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}

// 编码
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_address forKey:@"address"];
    [aCoder encodeInteger:_age forKey:@"age"];
}

@end
