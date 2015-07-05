//
//  CameraViewController.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPlaceHolderTextView.h"
#import "AppDelegate.h"
#import "AFHTTPRequestOperationManager.h"
#import "ImageUtility.h"
#import "UIAlertView+Blocks.h"

@interface CameraViewController : UIViewController <UIActionSheetDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property UIScrollView *scrollView;
@property UIView *borderView;
@property UIImageView *pictureImageView;
@property UIPlaceHolderTextView *descriptionTextView;
@property UIButton *submitButton;

@property UIImagePickerController *imagePickerController;
@property CGFloat viewAddHeight;
@property BOOL hasChoiceAvatar;


@end
