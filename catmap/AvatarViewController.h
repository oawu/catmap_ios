//
//  AvatarViewController.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "UIAlertView+Blocks.h"
#import "AsyncImageView.h"
#import "ImageUtility.h"
#import "Config.h"

@interface AvatarViewController : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property  AsyncImageView *avatarImageView;
@property UIButton *cameraButton, *albumButton;
@property UIView *avatarView;
@property UIImagePickerController *imagePickerController;

@property CGFloat avatarDimension;

@property BOOL hasChoiceAvatar;
@end
