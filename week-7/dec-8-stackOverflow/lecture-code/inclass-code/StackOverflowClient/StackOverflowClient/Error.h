//
//  Error.h
//  StackOverflowClient
//
//  Created by Adam Wallraff on 12/4/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kStackOverFlowErrorDomain;

typedef enum : NSUInteger {
    StackOverFlowBadJSON,
    StackOverFlowConnectionDown,
    StackOverFlowTooManyAttempts,
    StackOverFlowInvalidParameter,
    StackOverFlowNeedAuthentication,
    StackOverFlowGeneralError
} StackOverFlowErrorCodes;
