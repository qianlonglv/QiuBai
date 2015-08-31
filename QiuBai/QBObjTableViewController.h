//
//  QBObjTableViewController.h
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/28.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

#import "LastCell.h"

@interface QBObjTableViewController : UITableViewController

@property(nonatomic, strong) NSMutableArray *objects;
@property(nonatomic, assign) NSUInteger page;
@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) LastCell *lastCell;
@property (nonatomic, copy) NSString * (^generateURL)(NSUInteger page);
@property (nonatomic, copy) void (^tableWillReload)(NSUInteger responseObjectsCount);
@end
