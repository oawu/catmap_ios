//
//  PasswordViewController.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "PasswordViewController.h"

@interface PasswordViewController ()

@end

@implementation PasswordViewController

- (BOOL)checkData {
    NSString *str = [self.oldPasswordTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    
    if ([str length] <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請輸入舊密碼喔！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    
    str = [self.passwordTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    if ([str length] <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請輸入新密碼喔！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    
    str = [self.rePasswordTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    if ([str length] <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請輸入確認新密碼喔！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    str = [self.rePasswordTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    
    NSString *temp = [self.passwordTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    
    if (![str isEqualToString:temp]) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"新密碼與確認新密碼不符合喔！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    return YES;
}
- (void)saveAction:(id)sender {
    [self touchesBegan];
    
    if (![self checkData])
        return;
    
    UIAlertView *loadingAlert = [[UIAlertView alloc] initWithTitle:@"Loading..."
                                                           message:nil
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:nil, nil];
    [loadingAlert show];
    
    NSString *oldPassword = [self.oldPasswordTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [self.passwordTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    
    NSMutableDictionary *data = [NSMutableDictionary new];
    [data setValue:[[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"id"] forKey:@"id"];
    [data setValue:oldPassword forKey:@"old_password"];
    [data setValue:password forKey:@"new_password"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [manager POST:[NSString stringWithFormat:@"http://catmap.ioa.tw/api/v1/update_user_password"]
       parameters:data
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [loadingAlert dismissWithClickedButtonIndex:-1 animated:YES];
              
              if ([[responseObject objectForKey:@"status"] boolValue]) {
                  [[[UIAlertView alloc] initWithTitle:@"成功"
                                              message:@"修改資料成功！"
                                     cancelButtonItem:[RIButtonItem itemWithLabel:@"確定" action:^{
                      
                      [USER_DEFAULTS setValue:[responseObject objectForKey:@"user"] forKey:@"user"];
                      [self.navigationController popViewControllerAnimated:YES];
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
              
              [[[UIAlertView alloc] initWithTitle:@"提示"
                                          message:@"連線失敗，請確認網路連線狀況後再試一次..."
                                 cancelButtonItem:[RIButtonItem itemWithLabel:@"確定" ]
                                 otherButtonItems:nil, nil] show];
          }
     ];
}
- (void)initNav {
    [self.navigationItem setTitle:@"密碼設定"];
    
    UIBarButtonItem *saveBarButtonItem = [UIBarButtonItem new];
    [saveBarButtonItem setTitle:@"儲存"];
    [saveBarButtonItem setStyle:UIBarButtonItemStylePlain];
    [saveBarButtonItem setAction:@selector(saveAction:)];
    [saveBarButtonItem setTarget:self];
    [self.navigationItem setRightBarButtonItem: saveBarButtonItem];
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
- (void)initOldPasswordLabel {
    
    self.oldPasswordLabel = [UILabel new];
    [self.oldPasswordLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.oldPasswordLabel setText:@"使用者舊密碼："];
    [self.oldPasswordLabel setTextColor:[UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1]];
    [self.oldPasswordLabel setFont:[UIFont systemFontOfSize:20]];
    
    [self.scrollView addSubview:self.oldPasswordLabel];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:30.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:230.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:25.0]];
}
- (void)initOldPasswordTextField {
    
    self.oldPasswordTextField = [UITextField new];
    [self.oldPasswordTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.oldPasswordTextField setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.35]];
    [self.oldPasswordTextField.layer setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.5].CGColor];
    [self.oldPasswordTextField.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.oldPasswordTextField.layer setCornerRadius:4];
    
    [self.oldPasswordTextField.layer setSublayerTransform:CATransform3DMakeTranslation(5, 0, 0)];
    [self.oldPasswordTextField setPlaceholder:@"請輸入舊密碼.."];
    [self.oldPasswordTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.oldPasswordTextField setValue:[UIColor colorWithRed:0 green:0 blue:0 alpha:.3] forKeyPath:@"_placeholderLabel.textColor"];
    [self.oldPasswordTextField setSecureTextEntry:YES];
    [self.oldPasswordTextField setDelegate:self];
    [self.scrollView addSubview:self.oldPasswordTextField];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.oldPasswordTextField
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.oldPasswordTextField
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.oldPasswordTextField
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.oldPasswordTextField
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.oldPasswordTextField
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:35.0]];
}
- (void)initpasswordLabel {
    
    self.passwordLabel = [UILabel new];
    [self.passwordLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.passwordLabel setText:@"使用者新密碼："];
    [self.passwordLabel setTextColor:[UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1]];
    [self.passwordLabel setFont:[UIFont systemFontOfSize:20]];
    
    [self.scrollView addSubview:self.passwordLabel];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordTextField
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:20.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordLabel
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordLabel
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:25.0]];
}
- (void)initpasswordTextField {
    self.passwordTextField = [UITextField new];
    [self.passwordTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.passwordTextField setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.35]];
    [self.passwordTextField.layer setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.5].CGColor];
    [self.passwordTextField.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.passwordTextField.layer setCornerRadius:4];
    
    [self.passwordTextField.layer setSublayerTransform:CATransform3DMakeTranslation(5, 0, 0)];
    [self.passwordTextField setPlaceholder:@"請輸入新密碼.."];
    [self.passwordTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.passwordTextField setValue:[UIColor colorWithRed:0 green:0 blue:0 alpha:.3] forKeyPath:@"_placeholderLabel.textColor"];
    [self.passwordTextField setSecureTextEntry:YES];
    [self.passwordTextField setDelegate:self];
    [self.scrollView addSubview:self.passwordTextField];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.passwordLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:35.0]];
}
- (void)initRePasswordTextField {
    self.rePasswordTextField = [UITextField new];
    [self.rePasswordTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.rePasswordTextField setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.35]];
    [self.rePasswordTextField.layer setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.5].CGColor];
    [self.rePasswordTextField.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.rePasswordTextField.layer setCornerRadius:4];
    
    [self.rePasswordTextField.layer setSublayerTransform:CATransform3DMakeTranslation(5, 0, 0)];
    [self.rePasswordTextField setPlaceholder:@"請確認新密碼.."];
    [self.rePasswordTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.rePasswordTextField setValue:[UIColor colorWithRed:0 green:0 blue:0 alpha:.3] forKeyPath:@"_placeholderLabel.textColor"];
    [self.rePasswordTextField setSecureTextEntry:YES];
    [self.rePasswordTextField setDelegate:self];
    [self.scrollView addSubview:self.rePasswordTextField];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.rePasswordTextField
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.passwordTextField
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.rePasswordTextField
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.rePasswordTextField
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.rePasswordTextField
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.oldPasswordLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.rePasswordTextField
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:35.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.rePasswordTextField
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:-150.0]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.oldPasswordTextField) {
        [self.oldPasswordTextField resignFirstResponder];
        
        if ([self.passwordTextField.text length] <= 0) {
            [self.passwordTextField becomeFirstResponder];
        } else if ([self.rePasswordTextField.text length] <= 0) {
            [self.rePasswordTextField becomeFirstResponder];
        }
    } else if (textField == self.passwordTextField) {
        [self.passwordTextField resignFirstResponder];
        
        if ([self.rePasswordTextField.text length] <= 0) {
            [self.rePasswordTextField becomeFirstResponder];
        }
    } else if (textField == self.rePasswordTextField) {
        [self.rePasswordTextField resignFirstResponder];
    } else {
        [self.oldPasswordTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
        [self.rePasswordTextField resignFirstResponder];
    }
    
    return YES;
}
- (void)touchesBegan {
    [self textFieldShouldReturn: [UITextField new]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.layer setBackgroundColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1].CGColor];
    
    [self initNav];
    [self initScrollView];
    
    [self initOldPasswordLabel];
    [self initOldPasswordTextField];
    [self initpasswordLabel];
    [self initpasswordTextField];
    [self initRePasswordTextField];
    
    
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
    
    self.viewAddHeight = keyboardSize.height - (self.scrollView.contentSize.height - (self.focusTextField.frame.origin.y + self.focusTextField.frame.size.height));
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
    // Dispose of any resources that can be recreated.
}

@end
