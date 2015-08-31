//
//  MainViewController.h
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/15.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "titleBarView.h"
#import "HorizonalTableViewController.h"

@interface MainViewController : UIViewController

-(instancetype)initWithTitle:(NSString *)title andSubTitle:(NSArray *)subTitles andControllers:(NSArray *)controllers underTabbar:(BOOL)underTabbar;
-(instancetype)initWithTitle:(NSString *)title andSubTitle:(NSArray *)subTitles andControllers:(NSArray *)controllers;

@property(nonatomic, strong) titleBarView *titleBar;
@property(nonatomic, strong) HorizonalTableViewController *viewPage;

@end
