//
//  IndexTableViewCell.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface IndexTableViewCell : UITableViewCell

@property  UIView *borderView;
@property  AsyncImageView *pictureImageView;
@property  AsyncImageView *avatarImageView;
@property  UILabel *nameLabel;
@property  UILabel *createdLabel;
@property  UILabel *horizontalRuleLabel1;
@property  UILabel *descriptionLabel;
@property  UILabel *horizontalRuleLabel2;
@property  UIButton *commentButton;
@property  UIButton *likeButton;

@property CGFloat avatarDimension;


@property NSLayoutConstraint *horizontalRule1Description;
@property NSLayoutConstraint *descriptionHorizontalRule2;

+ (UIFont *) nameLabelFont;
+ (UIFont *) createdLabelFont;
+ (UIFont *) descriptionLabelFont;
+ (CGFloat) descriptionLabelLineSpacing;
+ (CGFloat) descriptionLabelSpacing;
+ (UIFont *) likeButtonFont;
+ (UIFont *) commentButtonFont;

- (IndexTableViewCell *)initBaseData;
- (IndexTableViewCell *)initUI:(id)picture w:(float)w;
@end
