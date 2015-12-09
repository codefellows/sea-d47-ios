//
//  User.h
//  StackOverflowClient
//
//  Created by nacnud on 12/6/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject
@property NSString *displayName;
@property NSURL *profileImageURL;
@property UIImage *profileImage;
@property NSURL *link;
@property int reputation;
@property int userID;
@property int acceptRate;

-(id)initWithDisplayName:(NSString*)displayName profileImageURL:(NSURL*)profileImageURL link:(NSURL*)link reputation:(int)reputation userID:(int)userID acceptRate:(int)acceptRate;
@end
