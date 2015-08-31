//
//  HorizonalTableViewController.h
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/21.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizonalTableViewController : UITableViewController

@property(nonatomic, strong) NSMutableArray *controllers;
@property(nonatomic, assign) NSUInteger currentIndex;


-(instancetype)initWithViewControllers:(NSArray *)controllers;
@property(nonatomic, copy) void (^changeIndex)(NSUInteger index);
@property(nonatomic, copy) void (^scrollView)(CGFloat offsetRatio, NSUInteger focusIndex, NSUInteger animationIndex);
@property (nonatomic, copy) void (^viewDidAppear)(NSInteger index);


-(void) scrollToViewAtIndex:(NSUInteger) index;

@end
