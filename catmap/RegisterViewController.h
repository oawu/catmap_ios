//
//  RegisterViewController.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "LoginViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIAlertView+Blocks.h"
#import "ImageUtility.h"
#import "Config.h"
#import "AsyncImageView.h"

//@interface RegisterViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@interface RegisterViewController : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property UIImageView *bgImageView;
@property UIScrollView *scrollView;
@property UILabel *titleLabel;

@property CGFloat avatarDimension;
@property UILabel *avatarLabel;
@property UIView *avatarView;
@property AsyncImageView *avatarImageView;

@property UILabel *baseLabel;
@property UITextField *nameTextField;

@property UILabel *advancedLabel;
@property UITextField *accountTextField;
@property UITextField *passwordTextField;

@property UILabel *verticalDividerLabel;
@property UIButton *cancelButton;
@property UIButton *submitButton;

@property UIImagePickerController *imagePickerController;
@property BOOL hasChoiceAvatar;
@property CGFloat viewAddHeight;
@property UITextField *focusTextField;

//@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
//@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
//@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
//@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
//@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
//@property (weak, nonatomic) IBOutlet UIButton *submitButton;
//@property (weak, nonatomic) IBOutlet UILabel *verticalDividerLabel;
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
