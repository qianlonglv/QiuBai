//
//  UIImageView+Util.m
//  QiuBai
//
//  Created by 吕彦龙 on 15/8/10.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import "UIImageView+Util.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (Util)

- (void)loadPortrait:(NSURL *)portraitURL
{
    [self sd_setImageWithURL:portraitURL placeholderImage:[UIImage imageNamed:@"default-portrait"] options:0];
}

@end
