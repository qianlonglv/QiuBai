//
//  QBTabBarController.m
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/13.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import "QBTabBarController.h"
#import "HotViewController.h"
#import "NewViewController.h"
#import "MaxHotController.h"
#import "MainViewController.h"
#import "ImageViewController.h"
#import "VideoViewController.h"
#import "MyInfoViewController.h"
#import <RESideMenu/RESideMenu.h>

@interface QBTabBarController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    HotViewController *EightViewCtrl;
    HotViewController *DayViewCtrl;
    MaxHotController *MaxHotViewCtrl;
    NewViewController *MaxNewViewCtrl;
}
@end

@implementation QBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EightViewCtrl = [[HotViewController alloc] initWithHotListType:HotListTypeEight];
    DayViewCtrl = [[HotViewController alloc] initWithHotListType:HotListTypeDay];
    MaxHotViewCtrl = [[MaxHotController alloc] init];
    MaxNewViewCtrl = [[NewViewController alloc] init];
    
    
    MainViewController *mainViewCtrl = [[MainViewController alloc] initWithTitle:@"热门" andSubTitle:@[@"8小时", @"24小时"] andControllers:@[EightViewCtrl, DayViewCtrl] underTabbar:YES];
    
    ImageViewController *imageViewCtrl = [[ImageViewController alloc] init];
    
    VideoViewController *videoViewCtrl = [[VideoViewController alloc] init];
    
    MyInfoViewController *myinfoViewCtrl = [[MyInfoViewController alloc] init];
    
    
    self.tabBar.translucent = NO;
    self.viewControllers = @[
                             [self addNavigationItemForViewController:mainViewCtrl],
                             [self addNavigationItemForViewController:imageViewCtrl],
                             [self addNavigationItemForViewController:videoViewCtrl],
                             [[UINavigationController alloc] initWithRootViewController:myinfoViewCtrl]
                             ];
    
    NSArray *titles = @[@"热门", @"图片", @"视频", @"我"];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop)
     {
         [item setTitle:titles[idx]];
     }
     ];
    
    //[self.tabBar addObserver:self forKeyPath:@"selectedItem" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UINavigationController *)addNavigationItemForViewController:(UIViewController *)ViewController
{
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:ViewController];
    
    ViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar-sidebar"] style:UIBarButtonItemStylePlain target:self action:@selector(onClickMenuButton)];
    
    ViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar-search"] style:UIBarButtonItemStylePlain target:self action:@selector(pushSearchViewController)];
    
    return navigationController;
    
}


-(void)onClickMenuButton
{
    [self.sideMenuViewController presentLeftMenuViewController];
}

-(void)pushSearchViewController
{
    
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
