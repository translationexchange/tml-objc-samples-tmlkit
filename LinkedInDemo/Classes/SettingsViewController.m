//
//  SettingsViewController.m
//  LinkedInDemo
//
//  Created by Michael Berkovich on 12/19/17.
//  Copyright © 2017 Translation Exchange, Inc. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsTableViewCell.h"
#import <TMLKit/TMLKit.h>

@interface SettingsViewController ()

@property(nonatomic, retain) NSDictionary *options;

@property(nonatomic, retain) NSString *selectedSection;

@property (weak, nonatomic) IBOutlet UIButton *communicationsButton;
@property (weak, nonatomic) IBOutlet UIButton *privacyButton;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;
@property (weak, nonatomic) IBOutlet UITableView *optionsTableView;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self resetButton:self.communicationsButton];
    [self resetButton:self.privacyButton];
    [self.accountButton setTitleColor:[UIColor colorWithRed:0.00 green:0.70 blue:1.00 alpha:1.0] forState: UIControlStateNormal];

    self.selectedSection = @"account";
    
    self.options = @{
                     @"account": @[
                          @{ @"title": @"Email addresses", @"description": @"Add or remove email addresses on your account"},
                          @{ @"title": @"Phone numbers", @"description": @"Add a phone number to help keep your account secure"},
                          @{ @"title": @"Change password", @"description": @"Choose a unique password to protect your account"},
                          @{ @"title": @"Autoplay videos", @"description": @"Choose if you want videos to autoplay on your phone"},
                          @{ @"title": @"Sync contacts", @"description": @"Automatically find people you know"},
                          @{ @"title": @"Sync calendar", @"description": @"Automatically sync your calendar"},
                          @{ @"title": @"Feed preferences", @"description": @"Make your feed your own"},
                          @{ @"title": @"Try Premium for free", @"description": @"Unlock the power of LinkedIn"},
                          @{ @"title": @"Where you're signed in", @"description": @"See your active sessions, and sing out if you'd like"},
                          @{ @"title": @"Close account", @"description": @"Learn about your options, and close your account if you wish"},
                          @{ @"title": @"Help Center"},
                          @{ @"title": @"Privacy Policy"},
                          @{ @"title": @"User Agreement"},
                          @{ @"title": @"End User License Agreement"},
                          @{ @"title": @"Sign Out"},
                          ],
                     @"privacy": @[
                             @{ @"title": @"Sharing profile edits", @"description": @"Choose whether we nbotify your network about profile changes"},
                             @{ @"title": @"Profile viewing options", @"description": @"Choose whether you're visible or viewing in private mode"},
                             @{ @"title": @"Manage active status", @"description": @"Choose how your status is displayed to your connections"},
                             @{ @"title": @"Who can follow you", @"description": @"Choose who can follow you and see your public posts"},
                             @{ @"title": @"Who you're blocking", @"description": @"See your list, and make changes if you'd like"},
                             @{ @"title": @"Manage who can discover your profile from your phone number", @"description": @"Choose who can discover your profile if they have your phone number"},
                             @{ @"title": @"Using public data to improve your profile", @"description": @"Choose whether we use public data to help you improve your profile"},
                             @{ @"title": @"Microsoft Word", @"description": @"Choose whether work experience descriptions from your LinkedIn profile can be shown in Resume Assistant, a feature within Microsoft Word"},
                             @{ @"title": @"Advertising Preferences", @"description": @"Choose whether LinkedIn can use cookies to personalize ads"},
                             @{ @"title": @"Help Center"},
                             @{ @"title": @"Privacy Policy"},
                             @{ @"title": @"User Agreement"},
                             @{ @"title": @"End User License Agreement"},
                             @{ @"title": @"Sign Out"},
                             ],
                     @"communications": @[
                             @{ @"title": @"Notifications", @"description": @"Choose what types of notifications you'd like to receive via email, push, or on LinkedIn"},
                             @{ @"title": @"Messages from members and partners", @"description": @"Let us know what type of messages you'd prefer to receive"},
                             @{ @"title": @"Receipts and indicators", @"description": @"Choose whether you want to turn on read receipts and typing indicators"},
                             @{ @"title": @"Messaging smart replies", @"description": @"Choose if you want to see recommended replies when responding to a message"},
                             @{ @"title": @"Help Center"},
                             @{ @"title": @"Privacy Policy"},
                             @{ @"title": @"User Agreement"},
                             @{ @"title": @"End User License Agreement"},
                             @{ @"title": @"Sign Out"},
                             ],
                     };
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *) optionAtIndex: (NSInteger) index {
    NSArray *selectedOptions = (NSArray *)[self.options objectForKey:self.selectedSection];
    return (NSDictionary*) [selectedOptions objectAtIndex:index];
}

- (NSUInteger) labelHeight: (NSString *) string forFont: (UIFont *) font {
    NSStringDrawingContext *ctx = [NSStringDrawingContext new];
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:string];
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:aString];
    CGRect textRect = [calculationView.text boundingRectWithSize:self.view.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:ctx];
    return textRect.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *option = [self optionAtIndex:indexPath.row];
    
    if ([option objectForKey:@"description"]) {
        return [self labelHeight: [option objectForKey:@"title"] forFont: [UIFont boldSystemFontOfSize:19]] +
        [self labelHeight: [option objectForKey:@"description"] forFont: [UIFont systemFontOfSize:15]] + 30;
    }
    
    return 50;
}

- (void) resetButton: (UIButton *) button {
    [button setTitleColor:[UIColor colorWithRed:0.40 green:0.40 blue:0.40 alpha:1.0] forState: UIControlStateNormal];
}

- (IBAction)changeSection:(id)sender {
    UIButton *button = (UIButton *) sender;

    [self resetButton:self.communicationsButton];
    [self resetButton:self.privacyButton];
    [self resetButton:self.accountButton];

    [button setTitleColor:[UIColor colorWithRed:0.00 green:0.70 blue:1.00 alpha:1.0] forState: UIControlStateNormal];

    if (button == self.communicationsButton) {
        self.selectedSection = @"communications";
    } else if (button == self.privacyButton) {
        self.selectedSection = @"privacy";
    } else {
        self.selectedSection = @"account";
    }
    
    [self.optionsTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *selectedOptions = (NSArray *)[self.options objectForKey:self.selectedSection];
    return [selectedOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *option = [self optionAtIndex:indexPath.row];

    SettingsTableViewCell *cell = (SettingsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"SettingsTableViewCell"];

    if (cell == nil) {
        cell = [[SettingsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingsTableViewCell"];
    }
    
    cell.titleLabel.text = TMLLocalizedString([option objectForKey:@"title"]);
    if ([option objectForKey:@"description"]) {
        cell.descriptionLabel.text = TMLLocalizedString([option objectForKey:@"description"]);
        cell.backgroundColor = [UIColor whiteColor];
    } else {
        cell.descriptionLabel.text = [option objectForKey:@""];
        cell.backgroundColor = [UIColor colorWithRed:0.90 green:0.89 blue:0.89 alpha:1.0];
    }
    
    return cell;
}


@end
