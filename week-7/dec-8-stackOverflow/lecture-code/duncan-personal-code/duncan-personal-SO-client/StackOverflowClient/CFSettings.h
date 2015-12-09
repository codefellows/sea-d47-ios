//
//  CFSettings.h
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SOSearchSettings.h"

@interface CFSettings : NSObject
@property SOSearchSettings *SOSearch;

+(CFSettings * _Nonnull) sharedSettings;

@end
