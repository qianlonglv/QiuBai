//
//  QBObjTableViewController.m
//  QiuBai
//
//  Created by 吕彦龙 on 15/7/28.
//  Copyright (c) 2015年 lvyanlong. All rights reserved.
//

#import "QBObjTableViewController.h"

#import "UIColor+Util.h"
#import <MBProgressHUD.h>

@interface QBObjTableViewController ()


@property(nonatomic, strong) AFHTTPRequestOperationManager *manager;
@end


@implementation QBObjTableViewController

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _objects = [NSMutableArray new];
        _page = 0;
    }
    
    
    return self;
}



- (void)dawnAndNightMode:(NSNotification *)center
{
    _lastCell.textLabel.backgroundColor = [UIColor themeColor];
    _lastCell.textLabel.textColor = [UIColor titleColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dawnAndNightNode) name:@"downAndNightNode" object:nil];
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.backgroundColor = [UIColor themeColor];
    
    _lastCell = [[LastCell alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    [_lastCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fetchMore)]];
    
    self.tableView.tableFooterView = _lastCell;
    
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
    _label = [UILabel new];
    _label.numberOfLines = 0;
    _label.lineBreakMode = NSLineBreakByWordWrapping;
    _label.font = [UIFont boldSystemFontOfSize:14];
    _lastCell.textLabel.textColor = [UIColor titleColor];
    
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.responseSerializer.acceptableContentTypes = [_manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [self fetchObjectsOnPage:15 refresh:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.tableView.separatorColor = [UIColor separatorColor];
    
    return _objects.count;
}

-(void) fetchObjectsOnPage:(NSUInteger) page refresh:(BOOL)refresh
{
    NSString *url = self.generateURL(page);
    [_manager GET:self.generateURL(page)
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject){
              NSString *content = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
              NSLog(@"123");
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error){
              UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
              MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:window];
              HUD.detailsLabelFont = [UIFont boldSystemFontOfSize:16];
              [window addSubview:HUD];
              [HUD show:YES];
              
              HUD.mode = MBProgressHUDModeCustomView;
              HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HUD-error"]];
              HUD.detailsLabelText = [NSString stringWithFormat:@"%@", error.userInfo[NSLocalizedDescriptionKey]];
              
              [HUD hide:YES afterDelay:1];
              
              _lastCell.status = LastCellStatusError;
              if (self.refreshControl.refreshing) {
                  [self.refreshControl endRefreshing];
              }
              [self.tableView reloadData];
          }];
}

- (void)fetchMore
{
    
}

- (void)refresh
{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}


/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
