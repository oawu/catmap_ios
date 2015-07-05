//
//  IndexTableViewCell.m
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import "IndexTableViewCell.h"

@implementation IndexTableViewCell

+ (UIFont *) nameLabelFont {
    return [UIFont systemFontOfSize:16.0f];
}
+ (UIFont *) createdLabelFont {
    return [UIFont systemFontOfSize:11.0f];
}
+ (UIFont *) descriptionLabelFont {
    return [UIFont systemFontOfSize:12.0f];
}
+ (CGFloat) descriptionLabelLineSpacing {
    return 2.f;
}
+ (CGFloat) descriptionLabelSpacing {
    return 0.5f;
}

+ (UIFont *) likeButtonFont {
    return [UIFont systemFontOfSize:13.0f];
}
+ (UIFont *) commentButtonFont {
    return [UIFont systemFontOfSize:13.0f];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)initBorderView {
    self.borderView = [UIView new];
    
    [self.borderView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.borderView.layer setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
    [self.borderView.layer setBorderColor:[UIColor colorWithRed:0.79 green:0.74 blue:0.72 alpha:1.0].CGColor];
    [self.borderView.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.borderView.layer setCornerRadius:5];
    [self.borderView setClipsToBounds:YES];
    
    [self.contentView addSubview:self.borderView];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant:10.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:-10.0]];
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1
                                                                  constant:10.0]];
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1
                                                                  constant:-10.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.borderView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0]];
}

- (void) initPictureImageView {
    self.pictureImageView = [AsyncImageView new];
    [self.pictureImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:self.pictureImageView];
    [self.pictureImageView setContentMode:UIViewContentModeScaleToFill];
    [self.pictureImageView.layer setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
    [self.pictureImageView.layer setBorderColor:[UIColor colorWithRed:0.79 green:0.74 blue:0.72 alpha:1.0].CGColor];
    [self.pictureImageView.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    
    [self.borderView addSubview:self.pictureImageView];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:0.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1
                                                                 constant:0.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    
}
- (void) initAvatarImageView {
    self.avatarDimension = 65;
    
    self.avatarImageView = [AsyncImageView new];
    [self.avatarImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.avatarImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.avatarImageView.layer setCornerRadius:self.avatarDimension / 2];
    [self.avatarImageView.layer setBorderColor:[UIColor colorWithRed:0.90 green:0.87 blue:0.87 alpha:1.0].CGColor];
    [self.avatarImageView.layer setBorderWidth:1.0f / [UIScreen mainScreen].scale];
    [self.avatarImageView setClipsToBounds:YES];
    
    [self.borderView addSubview:self.avatarImageView];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:13.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:self.avatarDimension]];
    
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:self.avatarDimension]];
}
- (void) initNameLabel {
    self.nameLabel = [UILabel new];
    [self.nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.borderView addSubview:self.nameLabel];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pictureImageView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:20.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.avatarImageView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:12.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:20.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:-15.0]];
    
}
- (void) initCreatedLabel {
    self.createdLabel = [UILabel new];
    [self.createdLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.createdLabel setFont:[IndexTableViewCell createdLabelFont]];
    [self.createdLabel setTextColor:[UIColor colorWithRed:0.9 green:0.3 blue:0.3 alpha:1]];
    
    [self.borderView addSubview:self.createdLabel];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.createdLabel
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.nameLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:2.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.createdLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.nameLabel
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:0.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.createdLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.nameLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:0.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.createdLabel
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:15.0]];
    
}
- (void) initHorizontalRuleLabel1 {
    self.horizontalRuleLabel1 = [UILabel new];
    [self.horizontalRuleLabel1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.horizontalRuleLabel1 setBackgroundColor:[UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:0.40]];
    
    [self.borderView addSubview:self.horizontalRuleLabel1];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.horizontalRuleLabel1
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.createdLabel
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.horizontalRuleLabel1
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.createdLabel
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:-5.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.horizontalRuleLabel1
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.createdLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:5.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.horizontalRuleLabel1
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:0.5]];
}
- (void) initDescriptionLabel {
    self.descriptionLabel = [UILabel new];
    [self.descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.descriptionLabel setText:@""];
    [self.descriptionLabel setAdjustsFontSizeToFitWidth:NO];
    [self.descriptionLabel setNumberOfLines:4];
    [self.descriptionLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [self.descriptionLabel setFont:[IndexTableViewCell descriptionLabelFont]];
    [self.descriptionLabel setTextColor:[UIColor colorWithRed:0.31 green:0.31 blue:0.31 alpha:1]];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:[IndexTableViewCell descriptionLabelLineSpacing]];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.descriptionLabel.text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.descriptionLabel.text length])];
    [attributedString addAttribute:NSKernAttributeName
                             value:@([IndexTableViewCell descriptionLabelSpacing])
                             range:NSMakeRange(0, [self.descriptionLabel.text length])];
    
    [self.descriptionLabel setAttributedText:attributedString];
    
    
    [self.borderView addSubview:self.descriptionLabel];
    
    self.horizontalRule1Description = [NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.horizontalRuleLabel1
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1
                                                                    constant:10.0];
    [self.borderView addConstraint:self.horizontalRule1Description];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.createdLabel
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:0.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.createdLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:0.0]];
}
- (void) initHorizontalRuleLabel2 {
    self.horizontalRuleLabel2 = [UILabel new];
    [self.horizontalRuleLabel2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.horizontalRuleLabel2 setBackgroundColor:[UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:0.40]];
    
    [self.borderView addSubview:self.horizontalRuleLabel2];
    
    self.descriptionHorizontalRule2 = [NSLayoutConstraint constraintWithItem:self.horizontalRuleLabel2
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.descriptionLabel
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1
                                                                    constant:10.0];
    [self.borderView addConstraint:self.descriptionHorizontalRule2];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.horizontalRuleLabel2
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.horizontalRuleLabel1
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:0.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.horizontalRuleLabel2
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.horizontalRuleLabel1
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:0.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.horizontalRuleLabel2
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:0.5]];
}
- (void)initCommentButtonButton {
    self.commentButton = [UIButton new];
    [self.commentButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.commentButton setImage: [UIImage imageNamed:@"CommentIcon"] forState:UIControlStateNormal];
    [self.commentButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 3.0, 1.0, 0.0)];
    [self.commentButton setTintColor:[UIColor colorWithRed:0.92 green:0.28 blue:0.29 alpha:1]];
    [self.commentButton setTitle:@"12 則留言" forState:UIControlStateNormal];
    [self.commentButton setTitleColor:[UIColor colorWithRed:0.92 green:0.28 blue:0.29 alpha:1] forState:UIControlStateNormal];
    [self.commentButton.titleLabel setNumberOfLines:1];
    [self.commentButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [self.commentButton.titleLabel setLineBreakMode:NSLineBreakByClipping];
    [self.commentButton.titleLabel setFont:[IndexTableViewCell commentButtonFont]];
    
    [self.borderView addSubview:self.commentButton];
    
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.commentButton
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.horizontalRuleLabel2
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:10.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.commentButton
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.createdLabel
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1
                                                                 constant:0.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.commentButton
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:20.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.commentButton
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.borderView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1
                                                                 constant:-10.0]];
}
- (void)initLikeButton {
    self.likeButton = [UIButton new];
    [self.likeButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.likeButton setImage: [UIImage imageNamed:@"LikeIcon"] forState:UIControlStateNormal];
    [self.likeButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 3.0, 1.0, 0.0)];
    [self.likeButton setTintColor:[UIColor colorWithRed:0.92 green:0.28 blue:0.29 alpha:1]];
    [self.likeButton setTitle:@"+11 最愛" forState:UIControlStateNormal];
    [self.likeButton setTitleColor:[UIColor colorWithRed:0.92 green:0.28 blue:0.29 alpha:1] forState:UIControlStateNormal];
    [self.likeButton.titleLabel setNumberOfLines:1];
    [self.likeButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [self.likeButton.titleLabel setLineBreakMode:NSLineBreakByClipping];
    [self.likeButton.titleLabel setFont:[IndexTableViewCell likeButtonFont]];
    
    [self.borderView addSubview:self.likeButton];
    
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.likeButton
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.commentButton
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1
                                                                 constant:-20.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.likeButton
                                                                attribute:NSLayoutAttributeCenterY
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.commentButton
                                                                attribute:NSLayoutAttributeCenterY
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self.borderView addConstraint:[NSLayoutConstraint constraintWithItem:self.likeButton
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:20.0]];
}

- (IndexTableViewCell *)initBaseData {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView.layer setBackgroundColor:[UIColor colorWithRed:0.9 green:0.88 blue:0.87 alpha:1].CGColor];
    
    [self initBorderView];
    [self initPictureImageView];
    [self initAvatarImageView];
    [self initNameLabel];
    [self initCreatedLabel];
    [self initHorizontalRuleLabel1];
    [self initDescriptionLabel];
    [self initHorizontalRuleLabel2];
    [self initCommentButtonButton];
    [self initLikeButton];
    return self;
}

- (IndexTableViewCell *)initUI:(id)picture w:(float)w {
    
    [self.pictureImageView setImageURL:[NSURL URLWithString:[[picture objectForKey:@"name"] objectForKey:@"800w"]]];
    if ([picture objectForKey:@"color"] != nil) {
        id color = [picture objectForKey:@"color"];
        [self.pictureImageView setBackgroundColor:[UIColor colorWithRed:[[color objectForKey:@"red"] doubleValue] / 255.0f
                                                                  green:[[color objectForKey:@"green"] doubleValue] / 255.0f
                                                                   blue:[[color objectForKey:@"blue"] doubleValue] / 255.0f alpha:0.85f]];
    }
    
    [self.avatarImageView setImageURL:[NSURL URLWithString:[[[picture objectForKey:@"user"] objectForKey:@"avatar"] objectForKey:@"130x130t"]]];
    if (([picture objectForKey:@"user"] != nil) && ([[picture objectForKey:@"user"] objectForKey:@"color"] != nil)) {
        id color = [[picture objectForKey:@"user"] objectForKey:@"color"];
        [self.avatarImageView setBackgroundColor:[UIColor colorWithRed:[[color objectForKey:@"red"] doubleValue] / 255.0f
                                                                 green:[[color objectForKey:@"green"] doubleValue] / 255.0f
                                                                  blue:[[color objectForKey:@"blue"] doubleValue] / 255.0f alpha:1.0f]];
    }
    
    [self.nameLabel setText:[[picture objectForKey:@"user"] objectForKey:@"name"]];
    
    if ([[picture objectForKey:@"address"] objectForKey:@"city"] != nil)
        [self.createdLabel setText:[NSString stringWithFormat:@"%@ · %@", [picture objectForKey:@"created_at"], [[picture objectForKey:@"address"] objectForKey:@"city"]]];
    else
        [self.createdLabel setText:[NSString stringWithFormat:@"%@", [picture objectForKey:@"created_at"]]];
    
    [self.horizontalRuleLabel1 setBackgroundColor:[UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:0.40]];
    [self.horizontalRuleLabel2 setBackgroundColor:[UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:0.40]];
    
    
    [self.descriptionLabel setText:[picture objectForKey:@"description"]];
    
    
    if ([[picture objectForKey:@"description"] isEqualToString:@""] || ([[picture objectForKey:@"description"] length] <= 0)) {
        [self.descriptionLabel setHidden:YES];
        [self.horizontalRuleLabel2 setHidden:YES];
        [self.horizontalRule1Description setConstant:0.0f];
        [self.descriptionHorizontalRule2 setConstant:-0.5f];
        [self updateConstraints];
    }
    return self;
}
@end
