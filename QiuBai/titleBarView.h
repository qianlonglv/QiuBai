//
//  titleBarView.h
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/21.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface titleBarView : UIScrollView

@property(nonatomic, strong) NSMutableArray *titleButtons;
@property(nonatomic, assign) NSInteger currentIndex;
@property(nonatomic, copy)  void (^titleButtonClicked)(NSUInteger index);

-(instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles;
-(void)setTitleButtonsColor;

@end
