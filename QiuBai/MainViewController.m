//
//  MainViewController.m
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/15.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import "MainViewController.h"
#import "UIColor+Util.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithTitle:(NSString *)title andSubTitle:(NSArray *)subTitles andControllers:(NSArray *)controllers
{
    return self;
}

- (instancetype)initWithTitle:(NSString *)title andSubTitle:(NSArray *)subTitles andControllers:(NSArray *)controllers underTabbar:(BOOL)underTabbar
{
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        if (title) {
            self.title = title;
        }
        
        CGFloat titleBarHeight = 36;
        _titleBar = [[titleBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, titleBarHeight) andTitles:subTitles];
        _titleBar.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:_titleBar];
        
        _viewPage = [[HorizonalTableViewController alloc] initWithViewControllers:controllers];
        
        CGFloat height = self.view.bounds.size.height - titleBarHeight - 64 - (underTabbar ? 49 : 0);
        _viewPage.view.frame = CGRectMake(0, titleBarHeight, self.view.bounds.size.width, height);
        
        [self addChildViewController:self.viewPage];
        [self.view addSubview:_viewPage.view];
        
        __weak titleBarView *weakTitleBar = _titleBar;
        __weak HorizonalTableViewController *weakViewPage = _viewPage;
        
        _viewPage.changeIndex = ^(NSUInteger index)
        {
            weakTitleBar.currentIndex = index;
            for (UIButton *button in weakTitleBar.titleButtons) {
                if (button.tag != index){
                    button.transform = CGAffineTransformIdentity;
                }
                else
                {
                    [button setTitleColor:[UIColor colorWithHex:0x009000] forState:UIControlStateNormal];
                    button.transform = CGAffineTransformMakeScale(1.2, 1.2);
                }
            }
            [weakViewPage scrollToViewAtIndex:index];

        };
        
        _viewPage.scrollView = ^(CGFloat offsetRatio, NSUInteger focusIndex, NSUInteger animationIndex) {
            UIButton *titleFrom = weakTitleBar.titleButtons[animationIndex];
            UIButton *titleTo = weakTitleBar.titleButtons[focusIndex];
            CGFloat colorValue = (CGFloat)0x90 / (CGFloat)0xFF;
            
            [UIView transitionWithView:titleFrom duration:0.1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                [titleFrom setTitleColor:[UIColor colorWithRed:colorValue*(1-offsetRatio) green:colorValue blue:colorValue*(1-offsetRatio) alpha:1.0]
                                forState:UIControlStateNormal];
                titleFrom.transform = CGAffineTransformMakeScale(1 + 0.2 * offsetRatio, 1 + 0.2 * offsetRatio);
            } completion:nil];
            
            
            [UIView transitionWithView:titleTo duration:0.1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                [titleTo setTitleColor:[UIColor colorWithRed:colorValue*offsetRatio green:colorValue blue:colorValue*offsetRatio alpha:1.0]
                              forState:UIControlStateNormal];
                titleTo.transform = CGAffineTransformMakeScale(1 + 0.2 * (1-offsetRatio), 1 + 0.2 * (1-offsetRatio));
            } completion:nil];
        };
        
        _titleBar.titleButtonClicked = ^(NSUInteger index) {
            [weakViewPage scrollToViewAtIndex:index];
        };

    }
    
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
