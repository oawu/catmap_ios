//
//  MyNavigationController.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.99 green:0.47 blue:0.3 alpha:1];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]}];
    [self.navigationBar setTranslucent:YES];
    [self.navigationBar setBarStyle:UIBarStyleDefault];
    
    
    // Do any additional setup after loading the view.
    //    [self.navigationBar setBarTintColor:[UIColor colorWithRed:254.0/255.0 green:210.0/255.0 blue:51.0/255.0 alpha:1.0]];
    
    
    
    //    self.extraColorLayer.backgroundColor = barTintColor.CGColor;
    
    //    [self.navigationBar setBarTintColor:[UIColor colorWithRed:0.41 green:0.25 blue:0.19 alpha:1]];
    ////    [self.navigationBar setAlpha:0.1f];
    ////    self.navigationBar.translucent = YES;
    //
    //    [self.navigationBar.layer setShadowColor:[UIColor colorWithRed:39.0/255.0 green:40.0/255.0 blue:34.0/255.0 alpha:1].CGColor];
    //    [self.navigationBar.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
    //    [self.navigationBar.layer setShadowRadius:3.0f];
    //    [self.navigationBar.layer setShadowOpacity:0.3f];
    //    [self.navigationBar setHidden:YES];
    //    [[UINavigationBar appearanceWhenContainedIn:[UINavigationController class], nil]
    //     setBarTintColor:[UIColor
    //                      colorWithRed:46.0 / 255.0
    //                      green:160.0 / 255.0
    //                      blue:152.0 / 255.0
    //                      alpha:0.8
    //                      ]
    //     ];
    
    //    self.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    //    self.navigationBar.translucent = YES;
    //    self.navigationBar.tintColor = [UIColor redColor];
    
    //    [self automaticallyAdjustsScrollViewInsets:YES];
    //    [self setNavigationBarHidden:YES animated:YES];
    //    self.navigationBar.autoresizingMask ^= UIViewAutoresizingFlexibleHeight;
    //    self.edgesForExtendedLayout = UIRectEdgeTop;
    
    //    [self.navigationBar setBackgroundImage:[UIImage new]
    //                                                  forBarMetrics:UIBarMetricsDefault];
    //    self.navigationBar.shadowImage = [UIImage new];
    //    self.navigationBar.translucent = YES;
    //    self.view.backgroundColor = [UIColor clearColor];
    //    self.navigationBar.backgroundColor = [UIColor clearColor];
    
    //    [self applyTransparentBackgroundToTheNavigationBar:[UIColor colorWithRed:0.6 green:0.45 blue:0.48 alpha:0.9]];
}

- (void)applyTransparentBackgroundToTheNavigationBar:(UIColor *)color {
    UIImage *transparentBackground;
    const CGFloat* components = CGColorGetComponents(color.CGColor);
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), NO, self.navigationBar.layer.contentsScale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, components[0], components[1], components[2], CGColorGetAlpha(color.CGColor));
    UIRectFill(CGRectMake(0, 0, 1, 1));
    transparentBackground = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    id navigationBarAppearance = self.navigationBar;
    
    [navigationBarAppearance setBackgroundImage:transparentBackground forBarMetrics:UIBarMetricsDefault];
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
