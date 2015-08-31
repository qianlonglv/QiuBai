//
//  titleBarView.m
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/21.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import "titleBarView.h"
#import "UIColor+Util.h"

@implementation titleBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        _currentIndex = 0;
        _titleButtons = [NSMutableArray new];
        
        CGFloat buttonWidth = frame.size.width / titles.count;
        CGFloat buttonHeight = frame.size.height;
        
        [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop)
         {
             UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
             button.backgroundColor = [UIColor titleBarColor];
             button.titleLabel.font = [UIFont systemFontOfSize:15];
             [button setTitleColor:[UIColor colorWithHex:0x909090] forState:UIControlStateNormal];
             [button setTitle:title forState:UIControlStateNormal];
             
             button.frame = CGRectMake(buttonWidth * idx, 0, buttonWidth, buttonHeight);
             button.tag = idx;
             [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
             
             [_titleButtons addObject:button];
             [self addSubview:button];
             [self sendSubviewToBack:button];
         }
         ];
        
        self.contentSize = CGSizeMake(frame.size.width, 25);
        self.showsHorizontalScrollIndicator = NO;
        UIButton *firstTitle = _titleButtons[0];
        [firstTitle setTitleColor:[UIColor colorWithHex:0x009000] forState:UIControlStateNormal];
        firstTitle.transform = CGAffineTransformMakeScale(1.15, 1.15);
        
    }
    
    return self;
}

-(void)onClick:(UIButton *)button
{
    if (_currentIndex != button.tag) {
        UIButton *preTitleButton = _titleButtons[_currentIndex];
        
        [preTitleButton setTitleColor:[UIColor colorWithHex:0x909090] forState:UIControlStateNormal];
        preTitleButton.transform = CGAffineTransformIdentity;
        
        [button setTitleColor:[UIColor colorWithHex:0x009000] forState:UIControlStateNormal];
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        _currentIndex = button.tag;
        //_titleButtonClicked(button.tag);
        
    }
}

@end
