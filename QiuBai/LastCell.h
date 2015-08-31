//
//  LastCell.h
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/28.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LastCellStatus)
{
    LastCellStatusNotVisible,
    LastCellStatusMore,
    LastCellStatusLoading,
    LastCellStatusError,
    LastCellStatusFinished,
    LastCellStatusEmpty,
};

@interface LastCell : UIView

@property(nonatomic, assign) LastCellStatus status;
@property (readonly, nonatomic, assign) BOOL shouldResponseToTouch;
@property (nonatomic, copy) NSString *emptyMessage;
@property(nonatomic, strong) UILabel *textLabel;
@end
