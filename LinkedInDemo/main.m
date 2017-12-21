//
//  main.m
//  LinkedInDemo
//
//  Created by Michael Berkovich on 12/19/17.
//  Copyright © 2017 Translation Exchange, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <TMLKit/TMLKit.h>

#ifndef TMLDefaultApplicationKey
#define TMLDefaultApplicationKey @"e9acf15536870a1cde3c3bba7704297a08c3a0c206c5846e209b651e80876358"
#endif

#ifndef DEBUG
#define DEBUG true
#endif

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [TML sharedInstanceWithApplicationKey:TMLDefaultApplicationKey];

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
