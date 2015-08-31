//
//  SideMenuViewController.m
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/13.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import "SideMenuViewController.h"
#import "UIView+Util.h"
#import "UIColor+Util.h"

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 160;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    
    UIImageView *portraitView = [UIImageView new];
    portraitView.contentMode = UIViewContentModeScaleAspectFit;
    [portraitView setCornerRadius:30];
    portraitView.userInteractionEnabled = YES;
    portraitView.translatesAutoresizingMaskIntoConstraints = NO;
    [headerView addSubview:portraitView];
    
    
    portraitView.image = [UIImage imageNamed:@"default-portrait"];
    
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"点击头像登陆";
    nameLabel.font = [UIFont boldSystemFontOfSize:20];
    nameLabel.textColor = [UIColor colorWithHex:0x696969];
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [headerView addSubview:nameLabel];
    
    
    NSDictionary *views = NSDictionaryOfVariableBindings(portraitView, nameLabel);
    NSDictionary *metrics = @{@"x": @([UIScreen mainScreen].bounds.size.width / 4 - 15)};
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[portraitView(60)]-10-[nameLabel]-15-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-x-[portraitView(60)]" options:0 metrics:metrics views:views]];
    
    return headerView;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    
    cell.backgroundColor = [UIColor clearColor];
    
    UIView *selectedBackground = [UIView new];
    selectedBackground.backgroundColor = [UIColor colorWithHex:0xCFCFCF];
    [cell setSelectedBackgroundView:selectedBackground];
    
    cell.imageView.image = [UIImage imageNamed:@[@"sidemenu_setting", @"sidemenu-night"][indexPath.row]];
    cell.textLabel.text = @[@"设置", @"夜间模式"][indexPath.row];
    
    cell.textLabel.font = [UIFont systemFontOfSize:19];
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor selectCellSColor];
    
    return cell;
}



@end
