//
//  photoSectionHeader.m
//  MWPhotoBrowser
//
//  Created by gaolili on 15/11/12.
//  Copyright © 2015年 Michael Waterfall. All rights reserved.
//

#import "PhotoSectionHeader.h"

@interface PhotoSectionHeader ()
@property (nonatomic, strong)UILabel * titleLabels;
@end

@implementation PhotoSectionHeader
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabels = [[UILabel alloc]init];
        _titleLabels.text = @"机构环境";
         [self addSubview:_titleLabels];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLabels.frame = self.bounds;
}
@end
