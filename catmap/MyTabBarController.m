//
//  MyTabBarController.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [(MyTabBar *)self.tabBar initUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToTabIndex0:) name:@"goToTabIndex0" object:nil];
    //    [self setSelectedIndex:3];
}
- (void)goToTabIndex0:(NSNotification*)sender {
    MyNavigationController *first = (MyNavigationController *)[self.viewControllers objectAtIndex:0];
    IndexTableViewController *temp = (IndexTableViewController *)[first.viewControllers objectAtIndex:0];
    
    
    [temp loadNewPicture:nil
           callbackBlock:^ (UITableView *tableView) {
               [tableView setContentOffset:CGPointZero animated:YES];
           }];
    [self setSelectedIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    NSLog(@"d");
//}


@end
