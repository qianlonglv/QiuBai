//
//  EightViewController.m
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/15.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import "HotViewController.h"
#import "HotCell.h"
#import "UIColor+Util.h"
#import "QBHot.h"


static NSString * const kHotCellID = @"HotCell";

@interface HotViewController ()

@end

@implementation HotViewController

- (instancetype) initWithHotListType:(HotListType)type
{
    self = [super init];
    
    if (self) {
        if (type == HotListTypeEight) {
            self.generateURL = ^NSString *(NSUInteger page)
            {
                return [NSString stringWithFormat:@"http://www.qiushibaike.com/8hr/page/%lu?s=4794366", page];
            };
        }
        else if(type == HotListTypeDay)
        {
            self.generateURL = ^NSString *(NSUInteger page)
            {
                return [NSString stringWithFormat:@"http://www.qiushibaike.com/8hr/page/%lu?s=4794366", page];
            };
        }

    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[HotCell class] forCellReuseIdentifier:kHotCellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    
    QBHot *Hot = self.objects[row];
    HotCell *cell = [tableView dequeueReusableCellWithIdentifier:kHotCellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor themeColor];
    
    [cell setContentWithTweet:Hot];
    
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor selectCellSColor];
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
