//
//  HotCell.h
//  QiuBai
//
//  Created by 吕彦龙 on 15/8/5.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBHot.h"

@interface HotCell : UITableViewCell

@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *portrait;

- (void)setContentWithTweet:(QBHot *)tweet;
@end
