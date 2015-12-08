//
//  SOMeQuestionsAPIService.m
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import "SOMeQuestionsAPIService.h"
#import "JSONAPIRequestService.h"


@implementation SOMeQuestionsAPIService
+(void )fetchMyQuestionswithCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler{
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    
    [parameters setObject:@"1" forKey:@"page"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
        NSString *accessToken = [defaults stringForKey:@"accessToken"];
    NSLog(@"accessToken: %@", accessToken);
    
    
//    defaults ge
//    [JSONAPIRequestService getRequestWithURL:@"http://www.google.com" parameters:nil withCompletion:^(NSData * _Nullable data, NSError * _Nullable error) {
//        
//        
//    }];
    
}

@end
