//
//  JSONRequestService.h
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface JSONRequestService : NSObject
+(void)getRequsetWithURL:(NSString* _Nonnull)url parameters:(NSDictionary *_Nullable)parameters withCompletion:(kNSDataCompletionHandler)completion;

@end
