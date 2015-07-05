//
//  NameViewController.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "NameViewController.h"

@interface NameViewController ()

@end

@implementation NameViewController

- (void)saveAction:(id)sender {
    [self touchesBegan];
    
    NSString *str = [self.nameTextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    
    if ([str length] <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請輸入暱稱喔！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return;
    }
    
    if ([[[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"name"] isEqualToString:str]) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    UIAlertView *loadingAlert = [[UIAlertView alloc] initWithTitle:@"Loading..."
                                                           message:nil
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:nil, nil];
    [loadingAlert show];
    
    
    NSMutableDictionary *data = [NSMutableDictionary new];
    [data setValue:[[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"id"] forKey:@"id"];
    [data setValue:str forKey:@"name"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [manager POST:[NSString stringWithFormat:@"http://catmap.ioa.tw/api/v1/update_user_name"]
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
    [self.navigationItem setTitle:@"暱稱設定"];
    
    UIBarButtonItem *saveBarButtonItem = [UIBarButtonItem new];
    [saveBarButtonItem setTitle:@"儲存"];
    [saveBarButtonItem setStyle:UIBarButtonItemStylePlain];
    [saveBarButtonItem setAction:@selector(saveAction:)];
    [saveBarButtonItem setTarget:self];
    [self.navigationItem setRightBarButtonItem: saveBarButtonItem];
}
- (void)initNameLabel {
    
    self.nameLabel = [UILabel new];
    [self.nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.nameLabel setText:@"使用者暱稱："];
    [self.nameLabel setTextColor:[UIColor colorWithRed:0.47 green:0.47 blue:0.47 alpha:1]];
    [self.nameLabel setFont:[UIFont systemFontOfSize:20]];
    
    [self.view addSubview:self.nameLabel];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.topLayoutGuide
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:30.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:230.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:25.0]];
}
- (void)initNameTextField {
    
    self.nameTextField = [UITextField new];
    [self.nameTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.nameTextField setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.35]];
    [self.nameTextField.layer setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.5].CGColor];
    [self.nameTextField.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.nameTextField.layer setCornerRadius:4];
    
    [self.nameTextField.layer setSublayerTransform:CATransform3DMakeTranslation(5, 0, 0)];
    [self.nameTextField setPlaceholder:@"請輸入暱稱.."];
    [self.nameTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.nameTextField setValue:[UIColor colorWithRed:0 green:0 blue:0 alpha:.3] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.nameTextField setDelegate:self];
    [self.view addSubview:self.nameTextField];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.nameLabel
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:10.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.nameLabel
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.nameLabel
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.nameTextField
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:35.0]];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL isAllowed = YES;
    
    NSString *temp = [[textField.text stringByReplacingCharactersInRange:range withString:string] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([temp length] > 200)
        isAllowed =  NO;
    
    return   isAllowed;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesBegan {
    [self textFieldShouldReturn: self.nameTextField];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.layer setBackgroundColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1].CGColor];
    [self initNav];
    [self initNameLabel];
    [self initNameTextField];
    
    [self.nameTextField setText:[[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"name"]];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesBegan)];
    tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
