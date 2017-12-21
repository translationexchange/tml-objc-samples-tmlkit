//
//  NewsfeedViewController.m
//  LinkedInDemo
//
//  Created by Michael Berkovich on 12/19/17.
//  Copyright © 2017 Translation Exchange, Inc. All rights reserved.
//

#import "NewsfeedViewController.h"
#import <TMLKit/TMLKit.h>
#import "NewsfeedStoryTableViewCell.h"

@interface NewsfeedViewController ()
@property(nonatomic, retain) NSArray *stories;
@property (weak, nonatomic) IBOutlet UITableView *storiesTableView;

@end

@implementation NewsfeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[TML sharedInstance] registerObjectWithReusableLocalizedStrings:self];
    self.stories = @[
                     @{
                         @"type": @"tagging",
                         @"story": @"[bold: {actor}] was tagged in {count || story}",
                         @"story_tokens": @{
                                 @"actor": @{@"value": @"Linda Williams", @"gender": @"female"},
                                 @"count": @2,
                                 @"bold": @{@"font": @{@"name": @"system", @"type": @"bold", @"size": @17}}
                                 },
                         @"name": @"Linda Williams",
                         @"mugshot": @"female-72",
                         @"job": @"Financial Analyst at Goodwin, Inc",
                         @"subtitle": @"",
                         @"likes_count": @301,
                         @"comments_count": @74,
                         @"height": @220
                         },

                     @{
                         @"type": @"following",
                         @"story": @"[bold: {actor}] is now following",
                         @"story_tokens": @{
                                 @"actor": @{@"value": @"Jean Walter", @"gender": @"female"},
                                 @"bold": @{@"font": @{@"name": @"system", @"type": @"bold", @"size": @17}}
                                 },
                         @"name": @"vAtomic Systems, Inc.",
                         @"mugshot": @"vatomic",
                         @"job": @"A communication platform that uses digital objects to help brands connect directly to consumers.",
                         @"subtitle": @"",
                         @"likes_count": @1056,
                         @"comments_count": @349,
                         @"height": @220
                         },
                     
                     @{
                         @"type": @"anniversary",
                         @"story": @"Congratulate [bold: {actor}] on {actor | his, her} work anniversary",
                         @"story_tokens": @{
                                 @"actor": @{@"value": @"Michael Hammond", @"gender": @"male"},
                                 @"bold": @{@"font": @{@"name": @"system", @"type": @"bold", @"size": @17}}
                                 },
                         @"name": @"Michael Hammond",
                         @"mugshot": @"male-7",
                         @"job": @"Founder & CEO at Acme, Inc",
                         @"subtitle": @"Celebrating [bold: {count || year}] at Acme, Inc.",
                         @"subtitle_tokens": @{
                                 @"count": @17,
                                 @"bold": @{@"font": @{@"name": @"system", @"type": @"bold", @"size": @17}}
                                 },
                         @"likes_count": @7,
                         @"comments_count": @2,
                         @"height": @250
                         
                         },
                     
                     @{
                         @"type": @"connection",
                         @"story": @"[bold: {actor}] is now connected with [bold: {target}]",
                         @"story_tokens": @{
                                 @"actor": @{@"value": @"Anna Carry", @"gender": @"female"},
                                 @"target": @{@"value": @"Mike Carter", @"gender": @"male"},
                                 @"bold": @{@"font": @{@"name": @"system", @"type": @"bold", @"size": @17}}
                                 },
                         @"name": @"Mike Carter",
                         @"mugshot": @"male-17",
                         @"job": @"Sr. Software Engineer at Agrava",
                         @"subtitle": @"",
                         @"likes_count": @10,
                         @"comments_count": @20,
                         @"height": @220
                         },

                     
                     @{
                         @"type": @"anniversary",
                         @"story": @"Congratulate [bold: {actor}] on {actor | his, her} work anniversary",
                         @"story_tokens": @{
                                 @"actor": @{@"value": @"Amanda Campbell", @"gender": @"female"},
                                 @"bold": @{@"font": @{@"name": @"system", @"type": @"bold", @"size": @17}}
                                 },
                         @"name": @"Amanda Campbell",
                         @"mugshot": @"female-54",
                         @"job": @"Marketing Manager",
                         @"subtitle": @"Celebrating [bold: {count || year}] at Protonics Systems, Inc.",
                         @"subtitle_tokens": @{
                                 @"count": @3,
                                 @"bold": @{@"font": @{@"name": @"system", @"type": @"bold", @"size": @17}}
                                 },
                         @"likes_count": @176,
                         @"comments_count": @23,
                         @"height": @250
                         
                         },

                     ];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)updateReusableTMLStrings {
//    [self.optionsTableView reloadData];
    [super updateReusableTMLStrings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *) storyAtIndex: (NSInteger) index {
    return (NSDictionary*) [self.stories objectAtIndex:index];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *story = [self storyAtIndex:indexPath.row];
   return (CGFloat) [[story objectForKey:@"height"] integerValue];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.stories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *story = [self storyAtIndex:indexPath.row];
    
    NewsfeedStoryTableViewCell *cell = (NewsfeedStoryTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"NewsfeedStoryTableViewCell"];
    if (cell == nil) {
        cell = [[NewsfeedStoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewsfeedStoryTableViewCell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.titleLabel.attributedText = TMLLocalizedAttributedString([story objectForKey:@"story"], [story objectForKey:@"story_tokens"]);
    cell.nameLabel.text = [story objectForKey:@"name"];
    cell.jobLabel.text = TMLLocalizedString([story objectForKey:@"job"]);
    [cell.likesButton setTitle: TMLLocalizedString(@"{count || Like}", @{@"count": [story objectForKey:@"likes_count"]}) forState:UIControlStateNormal];
    [cell.commentsButton setTitle: TMLLocalizedString(@"{count || Comment}", @{@"count": [story objectForKey:@"comments_count"]}) forState:UIControlStateNormal];

    if ([[story objectForKey:@"subtitle"] isEqualToString:@""]) {
        cell.subtitleLabel.attributedText = nil;
    } else {
        cell.subtitleLabel.attributedText = TMLLocalizedAttributedString([story objectForKey:@"subtitle"], [story objectForKey:@"subtitle_tokens"]);
    }
    cell.mugshotImage.image = [UIImage imageNamed:[story objectForKey:@"mugshot"]];
    
    
//    cell.titleLabel.text = TMLLocalizedString([option objectForKey:@"title"]);
//    if ([option objectForKey:@"description"]) {
//        cell.descriptionLabel.text = TMLLocalizedString([option objectForKey:@"description"]);
//        cell.backgroundColor = [UIColor whiteColor];
//    } else {
//        cell.descriptionLabel.text = [option objectForKey:@""];
//        cell.backgroundColor = [UIColor colorWithRed:0.90 green:0.89 blue:0.89 alpha:1.0];
//    }
    
    return cell;
}

@end
