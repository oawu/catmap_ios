//
//  PasswordViewController.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "UIAlertView+Blocks.h"
#import "Config.h"

@interface PasswordViewController : UIViewController <UITextFieldDelegate>

@property UIScrollView *scrollView;

@property UILabel *oldPasswordLabel;
@property UITextField *oldPasswordTextField;

@property UILabel *passwordLabel;
@property UITextField *passwordTextField;
@property UITextField *rePasswordTextField;

@property UITextField *focusTextField;
@property CGFloat viewAddHeight;
@end
