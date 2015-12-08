//
//  User.h
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//"owner": {
//    "reputation": 16,
//    "user_id": 4869378,
//    "user_type": "registered",
//    "profile_image": "https://www.gravatar.com/avatar/08faf0bdccd4ab2c29db380da4275860?s=128&d=identicon&r=PG&f=1",
//    "display_name": "kaushik",
//    "link": "http://stackoverflow.com/users/4869378/kaushik"
//},




@interface User : NSObject

@property NSString *displayName;
@property int userId;
@property NSString *userType;
@property NSURL *profileImageURL;
@property UIImage *pofileImage;
@property int repuation;
@property NSURL *link;

-(id)initWithDisplayName:(NSString*)displayName profileImageURL:(NSURL*)profileImageURL link:(NSURL*)link reputation:(int)reputation userID:(int)userID acceptRate:(int)acceptRate;

@end
