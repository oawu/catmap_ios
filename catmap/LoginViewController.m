//
//  LoginViewController.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)initBgImageView {
    self.bgImageView = [UIImageView new];
    [self.bgImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.bgImageView setImage:[UIImage imageNamed:@"LoginBackground"]];
    [self.bgImageView setContentMode:UIViewContentModeScaleAspectFill];
    
    [self.view addSubview:self.bgImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bgImageView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bgImageView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bgImageView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bgImageView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bgImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bgImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
}
- (void)initScrollView {
    self.scrollView = [UIScrollView new];
    [self.scrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:self.scrollView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
}
- (void)initTitle {
    self.titleLabel = [UILabel new];
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.titleLabel setText:@"OA's app v2.1"];
    [self.titleLabel setFont:[UIFont fontWithName:@"DIN Condensed" size: 50.0]];
    [self.titleLabel setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.85]];
    
    [self.titleLabel setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1]];
    [self.titleLabel setShadowOffset:CGSizeMake(0.5f, 0.5f)];
    
    //    [self.titleLabel.layer setBorderColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
    //    [self.titleLabel.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    
    [self.scrollView addSubview:self.titleLabel];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:50.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:50.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
}
- (void)initAvatarBgView {
    self.avatarDimension = 100;
    self.avatarBgView = [UIView new];
    [self.avatarBgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    [self.scrollView addSubview:self.avatarBgView];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarBgView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.titleLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:20.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarBgView
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:self.avatarDimension]];
    
    self.avatarBgViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.avatarBgView
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:self.avatarDimension];
    [self.scrollView addConstraint:self.avatarBgViewHeightConstraint];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarBgView
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
}
- (void)initAvatarView {
    
    self.avatarView = [UIView new];
    [self.avatarView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.avatarView.layer setCornerRadius:self.avatarDimension / 2];
    [self.avatarView.layer setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1].CGColor];
    [self.avatarView.layer setShadowOffset:CGSizeMake(0.5f, 0.5f)];
    [self.avatarView.layer setShadowRadius:3.0f];
    [self.avatarView.layer setShadowOpacity:0.5f];
    [self.avatarView setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    [self.avatarBgView addSubview:self.avatarView];
    
    [self.avatarBgView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.avatarBgView
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1
                                                                   constant:0]];
    
    [self.avatarBgView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.avatarBgView
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1
                                                                   constant:0]];
    
    [self.avatarBgView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                  attribute:NSLayoutAttributeLeading
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.avatarBgView
                                                                  attribute:NSLayoutAttributeLeading
                                                                 multiplier:1
                                                                   constant:0]];
    
    [self.avatarBgView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                  attribute:NSLayoutAttributeTrailing
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.avatarBgView
                                                                  attribute:NSLayoutAttributeTrailing
                                                                 multiplier:1
                                                                   constant:0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarBgView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarBgView
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    
    
}

- (void)setAvatar:(BOOL)isClean {
    [self.avatarImageView setBackgroundColor:[UIColor colorWithRed:236.0/255.0 green:140.0/255.0 blue:113.0/255.0 alpha:.3]];
    [self.avatarImageView setImage:[UIImage imageNamed:@"LoginAvatar"]];
    
    if (isClean || ([USER_DEFAULTS objectForKey:@"user"] == nil))
        return;
    
    id color = [[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"color"];
    
    if ((color != nil) && ([color objectForKey:@"red"] != nil) && ([color objectForKey:@"green"] != nil) && ([color objectForKey:@"blue"] != nil))
        [self.avatarImageView setBackgroundColor:[UIColor colorWithRed:[[color objectForKey:@"red"] doubleValue] / 255.0f
                                                                 green:[[color objectForKey:@"green"] doubleValue] / 255.0f
                                                                  blue:[[color objectForKey:@"blue"] doubleValue] / 255.0f alpha:1.0f]];
    
    id avatar = [[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"avatar"];
    
    if ((avatar != nil) && ([avatar objectForKey:@"200x200t"] != nil))
        [self.avatarImageView setImageURL:[NSURL URLWithString:[avatar objectForKey:@"200x200t"]]];
}

- (void)initAvatarImageView {
    
    self.avatarImageView = [AsyncImageView new];
    [self.avatarImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.avatarImageView setContentMode:UIViewContentModeScaleToFill];
    [self.avatarImageView.layer setBorderColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
    [self.avatarImageView.layer setBorderWidth:6.0f / [UIScreen mainScreen].scale];
    [self.avatarImageView.layer setCornerRadius:self.avatarDimension / 2];
    [self.avatarImageView setClipsToBounds:YES];
    
    [self setAvatar:NO];
    
    
    [self.avatarView addSubview:self.avatarImageView];
    
    [self.avatarView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.avatarView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarView
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.avatarView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:self.avatarDimension]];
    
    [self.avatarView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:self.avatarDimension]];
}
- (void)initAccountTextField {
    self.accountTextField = [UITextField new];
    [self.accountTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.accountTextField.layer setSublayerTransform:CATransform3DMakeTranslation(5, 0, 0)];
    [self.accountTextField setPlaceholder:@"請輸入帳號.."];
    [self.accountTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.accountTextField setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    if ([USER_DEFAULTS objectForKey:@"user"]) {
        [self.accountTextField setText:[[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"account"]];
    }
    
    [self.accountTextField setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.45]];
    [self.accountTextField.layer setBorderColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:.1].CGColor];
    [self.accountTextField.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.accountTextField.layer setCornerRadius:3];
    [self.accountTextField setKeyboardType:UIKeyboardTypeASCIICapable];
    [self.accountTextField setDelegate:self];
    [self.accountTextField addTarget:self action:@selector(accountTextFielddDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.scrollView addSubview:self.accountTextField];
    
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.accountTextField
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarBgView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:20.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.accountTextField
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:250]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.accountTextField
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:30]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.accountTextField
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
}
- (void)initPasswordTextField {
    self.passwordTextField = [UITextField new];
    [self.passwordTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.passwordTextField.layer setSublayerTransform:CATransform3DMakeTranslation(5, 0, 0)];
    [self.passwordTextField setSecureTextEntry:YES];
    [self.passwordTextField setPlaceholder:@"請輸入密碼.."];
    [self.passwordTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.passwordTextField setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.passwordTextField setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.45]];
    [self.passwordTextField.layer setBorderColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:.1].CGColor];
    [self.passwordTextField.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.passwordTextField.layer setCornerRadius:3];
    [self.passwordTextField setKeyboardType:UIKeyboardTypeASCIICapable];
    [self.passwordTextField setDelegate:self];
    
    [self.scrollView addSubview:self.passwordTextField];
    
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.accountTextField
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:5.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.accountTextField
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:30]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
}
- (void)initVerticalDividerLabel {
    self.verticalDividerLabel = [UILabel new];
    [self.verticalDividerLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.verticalDividerLabel setBackgroundColor:[UIColor colorWithRed:0.84 green:0.84 blue:0.84 alpha:.3]];
    [self.scrollView addSubview:self.verticalDividerLabel];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:40.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:-100.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:1.0 / [UIScreen mainScreen].scale]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:40]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
}

- (void)initRegisterButton {
    self.registerButton = [UIButton new];
    [self.registerButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.registerButton setTitle:@"註冊。加入" forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.5] forState:UIControlStateHighlighted];
    [self.registerButton.layer setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:234.0/255.0 blue:237.0/255.0 alpha:.2].CGColor];
    [self.registerButton.layer setCornerRadius:3];
    [self.registerButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [self.registerButton addTarget:self action:@selector(registerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.scrollView addSubview:self.registerButton];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:-10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.registerButton
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:0.0]];
}
- (BOOL)checkData {
    
    NSString *str = [[self.accountTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] lowercaseString];
    if ([str length] <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請輸入帳號喔！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    
    str = [self.passwordTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    if ([str length] <= 0) {
        
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請輸入密碼喔！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    return YES;
}
- (void)loginButtonAction:(id)sender {
    if (![self checkData])
        return;
    
    UIAlertView *loadingAlert = [[UIAlertView alloc] initWithTitle:@"Loading..."
                                                           message:nil
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:nil, nil];
    [loadingAlert show];
    
    NSMutableDictionary *data = [NSMutableDictionary new];
    [data setValue:[[self.accountTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] lowercaseString] forKey:@"account"];
    [data setValue:[self.passwordTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] forKey:@"password"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [manager POST:[NSString stringWithFormat:@"http://ios.ioa.tw/api/v1/login"]
       parameters:data
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [loadingAlert dismissWithClickedButtonIndex:-1 animated:YES];
              
              if ([[responseObject objectForKey:@"status"] boolValue]) {
                  [USER_DEFAULTS setValue:[responseObject objectForKey:@"user"] forKey:@"user"];
                  
                  MyTabBarController *myTabBarController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MyTabBarController"];
                  [[[[UIApplication sharedApplication] delegate] window] setRootViewController:myTabBarController];
              } else {
                  [[[UIAlertView alloc] initWithTitle:@"失敗"
                                              message:[responseObject objectForKey:@"message"]
                                     cancelButtonItem:[RIButtonItem itemWithLabel:@"確定"]
                                     otherButtonItems:nil, nil] show];
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              [loadingAlert dismissWithClickedButtonIndex:-1 animated:YES];
              
              [[[UIAlertView alloc] initWithTitle:@"提示"
                                          message:@"連線失敗，請確認網路連線狀況後再試一次..."
                                 cancelButtonItem:[RIButtonItem itemWithLabel:@"確定"]
                                 otherButtonItems:nil, nil] show];
          }
     ];
}


- (void)initLoginButton {
    self.loginButton = [UIButton new];
    [self.loginButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.loginButton setTitle:@"立即。登入" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.5] forState:UIControlStateHighlighted];
    [self.loginButton.layer setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:234.0/255.0 blue:237.0/255.0 alpha:.2].CGColor];
    [self.loginButton.layer setCornerRadius:3];
    [self.loginButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [self.loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.scrollView addSubview:self.loginButton];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.loginButton
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.loginButton
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.loginButton
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:0.0]];
}
- (void)initUI {
    [self initBgImageView];
    [self initScrollView];
    [self initTitle];
    [self initAvatarBgView];
    [self initAvatarView];
    [self initAvatarImageView];
    [self initAccountTextField];
    [self initPasswordTextField];
    [self initVerticalDividerLabel];
    [self initRegisterButton];
    [self initLoginButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesBegan)];
    tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
}
- (void)touchesBegan {
    [self textFieldShouldReturn: [UITextField new]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.accountTextField) {
        [self.accountTextField resignFirstResponder];
        
        if ([self.passwordTextField.text length] <= 0) {
            [self.passwordTextField becomeFirstResponder];
        }
    } else if (textField == self.passwordTextField) {
        [self.passwordTextField resignFirstResponder];
    } else {
        [self.accountTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
    }
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL isAllowed = YES;
    
    NSString *temp = [[textField.text stringByReplacingCharactersInRange:range withString:string] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ((textField == self.accountTextField) && [textField.text isEqualToString:temp])
        isAllowed =  NO;
    
    if ([temp length] > 200)
        isAllowed =  NO;
    
    return   isAllowed;
}
- (void)accountTextFielddDidChange :(UITextField *)textField{
    NSString *str = textField.text;
    str = [[str stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] lowercaseString];
    
    if ([[[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"account"] isEqualToString:str]) {
        
        [self setAvatar:NO];
        
        [UIView animateWithDuration:.5f animations:^{
            [self.avatarView setAlpha:1];
            [self.avatarBgViewHeightConstraint setConstant:self.avatarDimension];
            [self.scrollView layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:.5f animations:^{
            [self.avatarView setAlpha:0];
            [self.avatarBgViewHeightConstraint setConstant:0.0f];
            [self.scrollView layoutIfNeeded];
        } completion:^(BOOL finished) {
            if (finished) {
                [self setAvatar:YES];
            }
        }];
    }
}
-(void)registerButtonAction:(UIButton*)sender {
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    [registerViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:registerViewController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
