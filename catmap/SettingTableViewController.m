//
//  SettingTableViewController.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController () {
    NSMutableArray *features;
}

@end

@implementation SettingTableViewController
//- (void)viewDidAppear:(BOOL)animated {
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = self;
//        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.tableView.style = UITableViewRowActionStyleDestructive;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    UIBarButtonItem *barButtonItem = [UIBarButtonItem new];
    [barButtonItem setTitle:@"返回"];
    [barButtonItem setStyle:UIBarButtonItemStylePlain];
    [barButtonItem setTarget:self];
    
    [self.navigationItem setBackBarButtonItem:barButtonItem];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.tableView.layer setBackgroundColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1].CGColor];
    
    features = [NSMutableArray new];
    [features addObject:@{
                          @"name": @"一般設置",
                          @"items": @[
                                  @{
                                      @"name": @"頭像設定",
                                      @"action": @"AvatarViewController",
                                      @"image": @"Setting_00"
                                      },
                                  @{
                                      @"name": @"暱稱設定",
                                      @"action": @"NameViewController",
                                      @"image": @"Setting_01"
                                      },
                                  @{
                                      @"name": @"密碼設定",
                                      @"action": @"PasswordViewController",
                                      @"image": @"Setting_02"
                                      }
                                  ]
                          }];
    [features addObject:@{
                          @"name": @"其他設置",
                          @"items": @[
                                  @{
                                      @"name": @"登出",
                                      @"action": @"logout",
                                      @"image": @"Setting_03"
                                      }
                                  ]
                          }];
    
    //    [self.navigationController pushViewController:[PasswordViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [features count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}
//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
//
//    //    [headerView setBackgroundColor:[UIColor clearColor]];
//    NSLog(@"1");
//    //    [headerView.layer setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
//    [headerView.layer setBorderColor:[UIColor colorWithRed:0.79 green:0.74 blue:0.72 alpha:1.0].CGColor];
//    [headerView.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
//    //    [headerView.layer setCornerRadius:5];
//    return headerView;
//}
//- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
//
//    //    [headerView setBackgroundColor:[UIColor clearColor]];
//    NSLog(@"1");
//    //    [headerView.layer setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
//    [footerView.layer setBorderColor:[UIColor colorWithRed:0.79 green:0.74 blue:0.72 alpha:1.0].CGColor];
//    [footerView.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
//    //    [headerView.layer setCornerRadius:5];
//    return footerView;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.000001f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {    // Return the number of rows in the section.
    return [[[features objectAtIndex:section] objectForKey:@"items"] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[features objectAtIndex:section] objectForKey:@"name"];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cel" forIndexPath:indexPath];
    
    NSString *text = [[[[features objectAtIndex:indexPath.section] objectForKey:@"items"] objectAtIndex:indexPath.row] objectForKey:@"name"];
    NSString *action = [[[[features objectAtIndex:indexPath.section] objectForKey:@"items"] objectAtIndex:indexPath.row] objectForKey:@"action"];
    NSString *image = [[[[features objectAtIndex:indexPath.section] objectForKey:@"items"] objectAtIndex:indexPath.row] objectForKey:@"image"];
    
    [cell.textLabel setText:text];
    if (![action isEqualToString:@"logout"])
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell.imageView setImage:[UIImage imageNamed:image]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *action = [[[[features objectAtIndex:indexPath.section] objectForKey:@"items"] objectAtIndex:indexPath.row] objectForKey:@"action"];
    
    if ([action isEqualToString:@"logout"]) {
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[LoginViewController new]];
    } else {
        [self.navigationController pushViewController:[NSClassFromString(action) new] animated:YES];
    }
}
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
