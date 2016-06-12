//
//  RegisterViewController.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@end

@implementation RegisterViewController

- (void)initBgImageView {
    self.bgImageView = [UIImageView new];
    [self.bgImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.bgImageView setImage:[UIImage imageNamed:@"RegisterBackground"]];
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
    [self.titleLabel setText:@"會員註冊"];
    [self.titleLabel setFont:[UIFont fontWithName:@"DIN Condensed" size: 40.0]];
    [self.titleLabel setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.85]];
    
    [self.titleLabel setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1]];
    [self.titleLabel setShadowOffset:CGSizeMake(0.5f, 0.5f)];
    
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
- (void)initAvatarLabel {
    self.avatarLabel = [UILabel new];
    [self.avatarLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.avatarLabel setText:@"選擇照片"];
    [self.avatarLabel setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    [self.scrollView addSubview:self.avatarLabel];
    
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.titleLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:30.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.titleLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarLabel
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:23.0]];
}
- (void)initAvatarView {
    self.avatarDimension = 150;
    
    self.avatarView = [UIView new];
    [self.avatarView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.avatarView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.avatarView.layer setCornerRadius:self.avatarDimension / 2];
    [self.avatarView.layer setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1].CGColor];
    [self.avatarView.layer setShadowOffset:CGSizeMake(0.5f, 0.5f)];
    [self.avatarView.layer setShadowRadius:3.0f];
    [self.avatarView.layer setShadowOpacity:0.5f];
    
    [self.scrollView addSubview:self.avatarView];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.titleLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:self.avatarDimension]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:self.avatarDimension]];
}
- (void)initAvatarImageView {
    self.avatarImageView = [AsyncImageView new];
    
    self.avatarImageView = [AsyncImageView new];
    [self.avatarImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.avatarImageView setContentMode:UIViewContentModeScaleToFill];
    [self.avatarImageView.layer setBorderColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
    [self.avatarImageView.layer setBorderWidth:6.0f / [UIScreen mainScreen].scale];
    [self.avatarImageView.layer setCornerRadius:self.avatarDimension / 2];
    [self.avatarImageView setClipsToBounds:YES];
    [self.avatarImageView setBackgroundColor:[UIColor colorWithRed:236.0/255.0 green:140.0/255.0 blue:113.0/255.0 alpha:.3]];
    [self.avatarImageView setImage:[UIImage imageNamed:@"RegisterAvatar"]];
    [self.avatarImageView setContentMode:UIViewContentModeCenter];
    
    [self.avatarImageView.layer setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1].CGColor];
    [self.avatarImageView.layer setShadowOffset:CGSizeMake(0.5f, 0.5f)];
    [self.avatarImageView.layer setShadowRadius:3.0f];
    [self.avatarImageView.layer setShadowOpacity:0.5f];
    
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
- (void)initBaseLabel {
    self.baseLabel = [UILabel new];
    [self.baseLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.baseLabel setText:@"基本資料"];
    [self.baseLabel setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    [self.scrollView addSubview:self.baseLabel];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.baseLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:30.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.baseLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.titleLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.baseLabel
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:23.0]];
}
- (void)initNameTextField {
    self.nameTextField = [UITextField new];
    [self.nameTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.nameTextField setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.35]];
    [self.nameTextField.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.nameTextField.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.nameTextField.layer setCornerRadius:4];
    
    [self.nameTextField.layer setSublayerTransform:CATransform3DMakeTranslation(5, 0, 0)];
    [self.nameTextField setPlaceholder:@"請輸入暱稱.."];
    [self.nameTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.nameTextField setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.nameTextField setDelegate:self];
    [self.scrollView addSubview:self.nameTextField];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.baseLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.titleLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:250.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:30.0]];
    
    
}
- (void)initAdvancedLabel {
    self.advancedLabel = [UILabel new];
    [self.advancedLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.advancedLabel setText:@"進階資料"];
    [self.advancedLabel setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    [self.scrollView addSubview:self.advancedLabel];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.advancedLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.nameTextField
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:30.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.advancedLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.titleLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.advancedLabel
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:23.0]];
    
}
- (void)initAccountTextField {
    self.accountTextField = [UITextField new];
    [self.accountTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.accountTextField.layer setSublayerTransform:CATransform3DMakeTranslation(5, 0, 0)];
    [self.accountTextField setPlaceholder:@"請輸入帳號.."];
    [self.accountTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.accountTextField setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:.6] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.accountTextField setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.45]];
    [self.accountTextField.layer setBorderColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:.1].CGColor];
    [self.accountTextField.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.accountTextField.layer setCornerRadius:3];
    [self.accountTextField setKeyboardType:UIKeyboardTypeASCIICapable];
    
    [self.accountTextField setDelegate:self];
    [self.scrollView addSubview:self.accountTextField];
    
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.accountTextField
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.advancedLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
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
                                                                   toItem:self.titleLabel
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
                                                                 constant:50.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:-50.0]];
    
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

-(void)cancelButtonAction:(UIButton*)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)initCancelButton {
    self.cancelButton = [UIButton new];
    [self.cancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.5] forState:UIControlStateHighlighted];
    [self.cancelButton.layer setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:234.0/255.0 blue:237.0/255.0 alpha:.2].CGColor];
    [self.cancelButton.layer setCornerRadius:3];
    [self.cancelButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    
    [self.cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.cancelButton];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.cancelButton
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.cancelButton
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:-10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.cancelButton
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:0.0]];
}
- (void)initSubmitButton {
    self.submitButton = [UIButton new];
    [self.submitButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.submitButton setTitle:@"確定" forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.5] forState:UIControlStateHighlighted];
    [self.submitButton.layer setBackgroundColor:[UIColor colorWithRed:233.0/255.0 green:234.0/255.0 blue:237.0/255.0 alpha:.2].CGColor];
    [self.submitButton.layer setCornerRadius:3];
    [self.submitButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    
    [self.submitButton addTarget:self action:@selector(submitButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.submitButton];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.verticalDividerLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton
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
    [self initAvatarLabel];
    [self initAvatarView];
    [self initAvatarImageView];
    [self initBaseLabel];
    [self initNameTextField];
    [self initAdvancedLabel];
    [self initAccountTextField];
    [self initPasswordTextField];
    [self initVerticalDividerLabel];
    [self initCancelButton];
    [self initSubmitButton];
}

- (void)touchAvatarImage {
    [self touchesBegan];
    
    [[[UIActionSheet alloc] initWithTitle:@"請選擇方式"
                                 delegate:self
                        cancelButtonTitle:@"取消"
                   destructiveButtonTitle:@"拍照"
                        otherButtonTitles:@"選取照片", nil] showInView:[UIApplication sharedApplication].keyWindow];
}
-(void)cameraChangeDevice:(NSNotification *)notification {
    if(self.imagePickerController.cameraDevice == UIImagePickerControllerCameraDeviceFront) {
        [self.imagePickerController setCameraViewTransform:CGAffineTransformIdentity];
        [self.imagePickerController setCameraViewTransform:CGAffineTransformScale(self.imagePickerController.cameraViewTransform, -1, 1)];
    } else {
        [self.imagePickerController setCameraViewTransform:CGAffineTransformIdentity];
    }
}
- (void) showCamera {
    self.imagePickerController = [UIImagePickerController new];
    [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self.imagePickerController setCameraCaptureMode:UIImagePickerControllerCameraCaptureModePhoto];
    [self.imagePickerController setCameraFlashMode:UIImagePickerControllerCameraFlashModeAuto];
    [self.imagePickerController setDelegate:self];
    [self.imagePickerController setNavigationBarHidden:YES];
    
    [self.imagePickerController setCameraDevice:[UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront] ? UIImagePickerControllerCameraDeviceFront : UIImagePickerControllerCameraDeviceRear];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(cameraChangeDevice:)
                                                 name:@"AVCaptureDeviceDidStartRunningNotification"
                                               object:nil];
    
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}
- (void)showPhotoLibrary {
    self.imagePickerController = [UIImagePickerController new];
    [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self.imagePickerController setDelegate:self];
    [self.imagePickerController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self showCamera];
            break;
        case 1:
            [self showPhotoLibrary];
            break;
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.avatarImageView setImage:image];
    [self.avatarImageView setContentMode:UIViewContentModeScaleAspectFill];
    self.hasChoiceAvatar = YES;
    
    [self dismissViewControllerAnimated:YES completion:^{
        if ([self.nameTextField.text length] <= 0) {
            [self.nameTextField becomeFirstResponder];
        } else if ([self.accountTextField.text length] <= 0) {
            [self.accountTextField becomeFirstResponder];
        } else if ([self.passwordTextField.text length] <= 0) {
            [self.passwordTextField becomeFirstResponder];
        }
    }];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.nameTextField) {
        [self.nameTextField resignFirstResponder];
        
        if ([self.accountTextField.text length] <= 0) {
            [self.accountTextField becomeFirstResponder];
        } else if ([self.passwordTextField.text length] <= 0) {
            [self.passwordTextField becomeFirstResponder];
        }
    } else if (textField == self.accountTextField) {
        [self.accountTextField resignFirstResponder];
        
        if ([self.passwordTextField.text length] <= 0) {
            [self.passwordTextField becomeFirstResponder];
        }
    } else if (textField == self.passwordTextField) {
        [self.passwordTextField resignFirstResponder];
    } else {
        [self.nameTextField resignFirstResponder];
        [self.accountTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
    }
    
    return YES;
}
- (void)touchesBegan {
    [self textFieldShouldReturn: [UITextField new]];
}
- (void) cleanData {
    [self touchesBegan];
    
    [self.avatarImageView setImage:[UIImage imageNamed:@"RegisterAvatar"]];
    [self.avatarImageView setContentMode:UIViewContentModeCenter];
    self.hasChoiceAvatar = NO;
    self.focusTextField = nil;
    
    [self.nameTextField setText:@""];
    [self.accountTextField setText:@""];
    [self.passwordTextField setText:@""];
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
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    
    [self cleanData];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAvatarImage)];
    singleTap.numberOfTapsRequired = 1;
    [self.avatarImageView setUserInteractionEnabled:YES];
    [self.avatarImageView addGestureRecognizer:singleTap];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesBegan)];
    tapGesture.numberOfTapsRequired = 1;
    [self.scrollView addGestureRecognizer:tapGesture];
    
    self.viewAddHeight = 0;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.focusTextField = textField;
}

- (void)keyboardWillShow:(NSNotification *)notification {
    if ((self.viewAddHeight > 0) || (self.focusTextField == nil))
        return;
    
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    self.viewAddHeight = keyboardSize.height - (self.scrollView.contentSize.height - (self.focusTextField.frame.origin.y + self.focusTextField.frame.size.height)) + 20;
    self.viewAddHeight = self.viewAddHeight < 0 ? 0 : self.viewAddHeight;
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: 0.3f];
    self.view.frame = CGRectOffset(self.view.frame, 0, 0 - self.viewAddHeight);
    [UIView commitAnimations];
    
}
- (void)keyboardWillHide:(NSNotification*)notification {
    if (!self.isViewLoaded || !self.view.window || (self.focusTextField == nil))
        return;
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: 0.3f];
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [UIView commitAnimations];
    
    self.viewAddHeight = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)submitButtonAction:(id)sender {
    [self touchesBegan];
    
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
    [data setValue:[self.nameTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] forKey:@"name"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [manager POST:[NSString stringWithFormat:@"http://catmap.ioa.tw/api/v1/register"]
       parameters:data constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
           [formData appendPartWithFileData:UIImageJPEGRepresentation ([ImageUtility fixOrientation:self.avatarImageView.image], 0.1)
                                       name:@"avatar"
                                   fileName:@"avatar.jpg"
                                   mimeType:@"image/jepg"];
       }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [loadingAlert dismissWithClickedButtonIndex:-1 animated:YES];
              
              if ([[responseObject objectForKey:@"status"] boolValue]) {
                  [[[UIAlertView alloc] initWithTitle:@"成功"
                                              message:@"恭喜，註冊成功，你已經是會員了，趕快登入吧！"
                                     cancelButtonItem:[RIButtonItem itemWithLabel:@"確定" action:^{
                      
                      [USER_DEFAULTS setValue:[responseObject objectForKey:@"user"] forKey:@"user"];
                      
                      [self dismissViewControllerAnimated:YES completion:^(void) {
                          [self cleanData];
                      }];
                  }]
                                     otherButtonItems:nil, nil] show];
              } else {
                  [[[UIAlertView alloc] initWithTitle:@"失敗"
                                              message:[responseObject objectForKey:@"message"]
                                     cancelButtonItem:[RIButtonItem itemWithLabel:@"確定"]
                                     otherButtonItems:nil, nil] show];
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              [loadingAlert dismissWithClickedButtonIndex:-1 animated:YES];
              NSLog(@"%@", error);
              [[[UIAlertView alloc] initWithTitle:@"提示"
                                          message:@"連線失敗，請確認網路連線狀況後再試一次..."
                                 cancelButtonItem:[RIButtonItem itemWithLabel:@"確定" ]
                                 otherButtonItems:nil, nil] show];
          }
     ];
}
- (BOOL)checkData {
    
    if (!self.hasChoiceAvatar) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請挑選或使用相機拍攝一張照片！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    
    NSString *str = [self.nameTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    
    if ([str length] <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請輸入暱稱喔！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    
    str = [[self.accountTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] lowercaseString];
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

@end
