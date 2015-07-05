//
//  NameViewController.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "UIAlertView+Blocks.h"
#import "Config.h"

@interface NameViewController : UIViewController <UITextFieldDelegate>

@property UILabel *nameLabel;
@property UITextField *nameTextField;

@end
