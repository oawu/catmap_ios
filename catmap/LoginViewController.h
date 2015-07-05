//
//  LoginViewController.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "RegisterViewController.h"
#import "UIAlertView+Blocks.h"
#import "Config.h"
#import "AsyncImageView.h"
#import "MyTabBarController.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property UIImageView *bgImageView;
@property UIScrollView *scrollView;
@property UILabel *titleLabel;
@property UIView *avatarBgView;
@property UIView *avatarView;
@property AsyncImageView *avatarImageView;
@property UITextField *accountTextField;
@property UITextField *passwordTextField;
@property UILabel *verticalDividerLabel;

@property UIButton *registerButton;
@property UIButton *loginButton;

@property CGFloat avatarDimension;
@property NSLayoutConstraint *avatarBgViewHeightConstraint;

@end

