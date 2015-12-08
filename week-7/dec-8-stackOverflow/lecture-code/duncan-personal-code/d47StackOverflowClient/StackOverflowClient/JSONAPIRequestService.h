//
//  JSONAPIRequestService.h
//  StackOverflowClient
//
//  Created by nacnud on 12/6/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface JSONAPIRequestService : NSObject

+(void )getRequestWithURL:(NSString * _Nonnull)url parameters:(NSDictionary*)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler;
+(void)postRequestWithURL:(NSString * _Nonnull)url parameters:(NSDictionary* _Nullable)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler;
+(void)deleteRequestWithURL:(NSString * _Nonnull)url parameters:(NSDictionary* _Nullable)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler;

@end
