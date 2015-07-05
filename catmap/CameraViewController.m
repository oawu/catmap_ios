//
//  CameraViewController.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

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
- (void)initBorerView {
    self.borderView = [UIView new];
    [self.borderView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.borderView.layer setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
    [self.borderView.layer setBorderColor:[UIColor colorWithRed:0.79 green:0.74 blue:0.72 alpha:1.0].CGColor];
    [self.borderView.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.borderView.layer setCornerRadius:5];
    [self.borderView setClipsToBounds:YES];
    
    [self.scrollView addSubview:self.borderView];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:-10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scrollView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
}
- (void)initPictureImageView {
    self.pictureImageView = [UIImageView new];
    [self.pictureImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pictureImageView setBackgroundColor:[UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1]];
    [self.pictureImageView.layer setBorderColor:[UIColor colorWithRed:0.79 green:0.74 blue:0.72 alpha:0.5].CGColor];
    [self.pictureImageView.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.pictureImageView setClipsToBounds:YES];
    [self.pictureImageView setUserInteractionEnabled:YES];
    
    [self.borderView addSubview:self.pictureImageView];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:0.7f
                                                                 constant:0]];
    
}
- (void)initDescriptionTextView {
    self.descriptionTextView = [UIPlaceHolderTextView new];
    [self.descriptionTextView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.descriptionTextView setPlaceholder:@"請輸入照片說明..."];
    [self.descriptionTextView setPlaceholderColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.57 alpha:1]];
    [self.descriptionTextView.layer setBorderColor:[UIColor colorWithRed:0.79 green:0.74 blue:0.72 alpha:1.0].CGColor];
    [self.descriptionTextView.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.descriptionTextView.layer setCornerRadius:5];
    [self.descriptionTextView setClipsToBounds:YES];
    [self.descriptionTextView setDelegate:self];
    
    [self.borderView addSubview:self.descriptionTextView];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:15.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:20]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:-20]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionTextView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:128]];
}
- (void)initSubmitButton {
    self.submitButton = [UIButton new];
    [self.submitButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.submitButton.layer setBorderColor:[UIColor redColor].CGColor];
    [self.submitButton.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.submitButton.layer setCornerRadius:4];
    [self.submitButton setClipsToBounds:YES];
    [self.submitButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self.submitButton setTitle:@"確定送出" forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:.7] forState:UIControlStateHighlighted];
    [self.submitButton.layer setBackgroundColor:[UIColor colorWithRed:0.91 green:0.37 blue:0.32 alpha:1].CGColor];
    [self.submitButton addTarget:self action:@selector(submitButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.borderView addSubview:self.submitButton];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.descriptionTextView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:15.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:20]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:-20]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:-15.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.submitButton
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:40]];
}
- (void)initUI {
    [self initScrollView];
    [self initBorerView];
    [self initPictureImageView];
    [self initDescriptionTextView];
    [self initSubmitButton];
}
- (void) cleanData {
    [self touchesBegan];
    
    self.hasChoiceAvatar = NO;
    self.viewAddHeight = 0;
    [self.pictureImageView setImage:[UIImage imageNamed:@"CameraDefaultPicture"]];
    [self.pictureImageView setContentMode:UIViewContentModeCenter];
    
    [self.descriptionTextView setText:@""];
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
    
    [self.imagePickerController setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    
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
- (void)touchesBegan {
    [self.descriptionTextView resignFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.layer setBackgroundColor:[UIColor colorWithRed:0.9 green:0.88 blue:0.87 alpha:1].CGColor];
    
    [self initUI];
    [self cleanData];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAvatarImage)];
    singleTap.numberOfTapsRequired = 1;
    [self.pictureImageView addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesBegan)];
    tapGesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.pictureImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.pictureImageView setImage:image];
    self.hasChoiceAvatar = YES;
    
    [self dismissViewControllerAnimated:YES completion: ^ {
        if ([self.descriptionTextView.text length] <= 0) {
            [self.descriptionTextView becomeFirstResponder];
        }
    }];
}
- (void)keyboardWillShow:(NSNotification *)notification {
    if (self.viewAddHeight > 0)
        return;
    
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    self.viewAddHeight = keyboardSize.height - (self.scrollView.contentSize.height - (self.descriptionTextView.frame.origin.y + self.descriptionTextView.frame.size.height));
    self.viewAddHeight = self.viewAddHeight < 0 ? 0 : self.viewAddHeight;
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: 0.3f];
    self.view.frame = CGRectOffset(self.view.frame, 0, 0 - self.viewAddHeight);
    [UIView commitAnimations];
    
}
- (void)keyboardWillHide:(NSNotification*)notification {
    if (!self.isViewLoaded || !self.view.window)
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
    [data setValue:[self.descriptionTextView.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] forKey:@"description"];
    [data setValue:[[USER_DEFAULTS objectForKey:@"user"] objectForKey:@"id"] forKey:@"user_id"];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [data setValue:[NSString stringWithFormat:@"%f", app.location.coordinate.latitude] forKey:@"position[latitude]"];
    [data setValue:[NSString stringWithFormat:@"%f", app.location.coordinate.longitude] forKey:@"position[longitude]"];
    [data setValue:[NSString stringWithFormat:@"%f", app.location.altitude] forKey:@"position[altitude]"];
    
    [data setValue:[NSString stringWithFormat:@"%f", app.location.horizontalAccuracy] forKey:@"accuracy[horizontal]"];
    [data setValue:[NSString stringWithFormat:@"%f", app.location.verticalAccuracy] forKey:@"accuracy[vertical]"];
    
    [data setValue:app.locationInfo[@"City"] forKey:@"address[city]"];
    [data setValue:app.locationInfo[@"Country"] forKey:@"address[country]"];
    [data setValue:[app.locationInfo[@"FormattedAddressLines"] firstObject] forKey:@"address[address]"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [manager POST:[NSString stringWithFormat:@"http://catmap.ioa.tw/api/v1/create_picture"]
       parameters:data constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
           [formData appendPartWithFileData:UIImageJPEGRepresentation ([ImageUtility fixOrientation:self.pictureImageView.image], 0.1)
                                       name:@"name"
                                   fileName:@"fg.jpg"
                                   mimeType:@"image/jepg"];
       }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [loadingAlert dismissWithClickedButtonIndex:-1 animated:YES];
              
              if ([[responseObject objectForKey:@"status"] boolValue]) {
                  [self cleanData];
                  [[NSNotificationCenter defaultCenter] postNotificationName:@"goToTabIndex0" object:nil];
              } else {
                  [[[UIAlertView alloc] initWithTitle:@"提示，照片上傳失敗！"
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

- (BOOL)checkData {
    if (!self.hasChoiceAvatar) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請挑選或使用相機拍攝一張照片！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    
    NSString *str = [self.descriptionTextView.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    if ([str length] <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:@"請輸入照片說明喔！"
                                   delegate:self
                          cancelButtonTitle:@"確定"
                          otherButtonTitles:nil, nil] show];
        return NO;
    }
    return YES;
}

@end
