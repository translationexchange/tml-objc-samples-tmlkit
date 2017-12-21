//
//  NewsfeedStoryTableViewCell.h
//  LinkedInDemo
//
//  Created by Michael Berkovich on 12/19/17.
//  Copyright © 2017 Translation Exchange, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsfeedStoryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UIButton *likesButton;
@property (weak, nonatomic) IBOutlet UIButton *commentsButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIImageView *mugshotImage;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end
