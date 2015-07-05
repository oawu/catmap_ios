//
//  AvatarViewController.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "AvatarViewController.h"

@interface AvatarViewController ()

@end

@implementation AvatarViewController


//- (void)backPreviousVC {
//    SettingTableViewController *previousVC = (SettingTableViewController *)[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 2];
//    [previousVC test];
////    [self.navigationController popViewControllerAnimated:YES];
//            [self.navigationController popToRootViewControllerAnimated:YES];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.layer setBackgroundColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1].CGColor];
    
    [self initNav];
    [self initAvatarView];
    [self initAvatar];
    [self initCameraButton];
    [self initAlbumButton];
    
    if ([USER_DEFAULTS objectForKey:@"user"] != nil) {
        if ([[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"color"] != nil) {
            id color = [[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"color"];
            [self.avatarImageView setBackgroundColor:[UIColor colorWithRed:[[color objectForKey:@"red"] doubleValue] / 255.0f
                                                                     green:[[color objectForKey:@"green"] doubleValue] / 255.0f
                                                                      blue:[[color objectForKey:@"blue"] doubleValue] / 255.0f alpha:1.0f]];
        }
        
        if (([[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"avatar"] != nil) && ([[[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"avatar"] objectForKey:@"400x400t"] != nil)) {
            [self.avatarImageView setImageURL:[NSURL URLWithString:[[[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"avatar"] objectForKey:@"400x400t"]]];
        }
    }
    
    self.hasChoiceAvatar = NO;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAvatarImage)];
    singleTap.numberOfTapsRequired = 1;
    
    [self.avatarImageView setUserInteractionEnabled:YES];
    [self.avatarImageView addGestureRecognizer:singleTap];
}

- (void)saveAction:(id)sender {
    if (!self.hasChoiceAvatar) {
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
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [manager POST:[NSString stringWithFormat:@"http://catmap.ioa.tw/api/v1/update_user_avatar"]
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
    [self.navigationItem setTitle:@"頭像設定"];
    
    UIBarButtonItem *saveBarButtonItem = [UIBarButtonItem new];
    [saveBarButtonItem setTitle:@"儲存"];
    [saveBarButtonItem setStyle:UIBarButtonItemStylePlain];
    [saveBarButtonItem setAction:@selector(saveAction:)];
    [saveBarButtonItem setTarget:self];
    [self.navigationItem setRightBarButtonItem: saveBarButtonItem];
}
- (void)initAvatarView {
    
    self.avatarDimension = 200;
    
    self.avatarView = [UIView new];
    
    [self.avatarView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.avatarView.layer setCornerRadius:self.avatarDimension / 2];
    [self.avatarView.layer setShadowColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:1].CGColor];
    [self.avatarView.layer setShadowOffset:CGSizeMake(0.5f, 0.5f)];
    [self.avatarView.layer setShadowRadius:3.0f];
    [self.avatarView.layer setShadowOpacity:0.5f];
    
    [self.view addSubview:self.avatarView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.topLayoutGuide
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:30.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:self.avatarDimension]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:self.avatarDimension]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
}
- (void)initAvatar {
    self.avatarImageView = [AsyncImageView new];
    
    [self.avatarImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:self.avatarImageView];
    [self.avatarImageView setContentMode:UIViewContentModeScaleToFill];
    [self.avatarImageView.layer setBorderColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
    [self.avatarImageView.layer setBorderWidth:10.0f / [UIScreen mainScreen].scale];
    [self.avatarImageView.layer setCornerRadius:self.avatarDimension / 2];
    [self.avatarImageView setClipsToBounds:YES];
    [self.avatarImageView setBackgroundColor:[UIColor colorWithRed:236.0/255.0 green:140.0/255.0 blue:113.0/255.0 alpha:.3]];
    [self.avatarImageView setContentMode:UIViewContentModeScaleAspectFill];
    
    [self.avatarView addSubview:self.avatarImageView];
    
    [self.avatarView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:0]];
    
    [self.avatarView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:0]];
    
    [self.avatarView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:0]];
    
    [self.avatarView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:0]];
}
- (void)initCameraButton {
    self.cameraButton = [UIButton new];
    [self.cameraButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.cameraButton setTitle:@"開啟相機" forState:UIControlStateNormal];
    [self.cameraButton setTitleColor:[UIColor colorWithRed:0.76 green:0.76 blue:0.76 alpha:1] forState:UIControlStateHighlighted];
    [self.cameraButton setTitleColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:.7] forState:UIControlStateNormal];
    [self.cameraButton.layer setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.3].CGColor];
    [self.cameraButton.layer setBorderColor:[UIColor colorWithRed:0.79 green:0.74 blue:0.72 alpha:1.0].CGColor];
    [self.cameraButton.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.cameraButton.layer setCornerRadius:3];
    [self.cameraButton setClipsToBounds:YES];
    [self.cameraButton addTarget:self action:@selector(showCamera) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.cameraButton];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.cameraButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.avatarImageView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:40.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.cameraButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:200]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.cameraButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:40]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.cameraButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.avatarImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
}
- (void)initAlbumButton {
    self.albumButton = [UIButton new];
    [self.albumButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.albumButton setTitle:@"開啟相簿" forState:UIControlStateNormal];
    [self.albumButton setTitleColor:[UIColor colorWithRed:0.76 green:0.76 blue:0.76 alpha:1] forState:UIControlStateHighlighted];
    [self.albumButton setTitleColor:[UIColor colorWithRed:0.15 green:0.16 blue:0.13 alpha:.7] forState:UIControlStateNormal];
    [self.albumButton.layer setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.3].CGColor];
    [self.albumButton.layer setBorderColor:[UIColor colorWithRed:0.79 green:0.74 blue:0.72 alpha:1.0].CGColor];
    [self.albumButton.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.albumButton.layer setCornerRadius:3];
    [self.albumButton setClipsToBounds:YES];
    [self.albumButton addTarget:self action:@selector(showPhotoLibrary) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.albumButton];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.albumButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.cameraButton
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:20.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.albumButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:200]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.albumButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:40]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.albumButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.cameraButton
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];}

- (void)touchAvatarImage {
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
    self.hasChoiceAvatar = YES;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
