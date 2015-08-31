//
//  EightViewController.h
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/15.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import "QBObjTableViewController.h"

typedef NS_ENUM(int, HotListType)
{
    HotListTypeAllType = 0,
    HotListTypeEight,
    HotListTypeDay,
};


@interface HotViewController : QBObjTableViewController

- (instancetype) initWithHotListType:(HotListType)type;
@end
