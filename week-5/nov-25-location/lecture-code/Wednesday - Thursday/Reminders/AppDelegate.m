//
//  AppDelegate.m
//  Reminders
//
//  Created by Michael Babiy on 11/16/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupParse];
    [self registerForNotifications];
    
    return YES;
}

- (void)setupParse {
    [Parse setApplicationId:@"wA9hzHt1Qbgg2dDsFmnaypOckQUZBii25m28hFLD" clientKey:@"vhElcNJV1eJAg5HLzsXiit9yVjR5beWdtEn2t389"];
}

- (void)registerForNotifications {
    [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
}

@end
