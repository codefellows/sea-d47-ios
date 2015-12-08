//
//  SOSearchJSONParser.m
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import "SOSearchJSONParser.h"
#import "User.h"
#import "Question.h"

@implementation SOSearchJSONParser
+(void)questionsArrayFromDictionary:(NSDictionary *)dictionary completionHandler:(kNSArrayCompletionHandler)completion {
    
    NSMutableArray *result = [[NSMutableArray<Question *> alloc] init];
    
    if (dictionary) {
        NSMutableArray *items = dictionary[@"items"];
        if (items) {
            for (NSDictionary *item in items) {
                User *owner;
                if (item) {
                    NSDictionary *ownerDictionary = item[@"owner"];
                    if (ownerDictionary) {
                        NSString *displayName = ownerDictionary[@"display_name"];
                        NSString *profileImageURLString = ownerDictionary[@"profile_image"];
                        NSString *linkURLString = ownerDictionary[@"link"];
                        int reputation = (int) ownerDictionary[@"reputation"];
                        int userID = (int) ownerDictionary[@"user_id"];
                        int acceptRate = (int) ownerDictionary[@"accpet_rate"];
                        
                        NSURL *profileImageURL = [[NSURL alloc] initWithString:profileImageURLString];
                        
                        NSURL *link = [[NSURL alloc] initWithString:linkURLString];
                        
                        owner = [[User alloc] initWithDisplayName:displayName profileImageURL:profileImageURL link:link reputation:reputation userID:userID acceptRate:acceptRate];

                    }
                    
                    NSString *title = item[@"title"];
                    int questionID = (int) item[@"question_id"];
                    int viewCount = (int) item[@"view_count"];
                    int score = (int) item[@"score"];
                    BOOL isAnswered = (BOOL) item[@"is_answered"];
                    
                    Question *question = [[Question alloc] initWithTitle:title owner:owner questionID:questionID viewCount:viewCount score:score isAnswered:isAnswered];
                    
                    if (question != nil) {
                        [result addObject:question];
                    }
  
                }
            }
            
            if (result != nil) {
                completion(result, nil);
                return;
            }
            
        }
    }
    
    NSError *error = [NSError errorWithDomain:@"ERROR: failed to complet requset to SO 2.2/search" code:-1 userInfo:nil];
    
    completion(nil, error);
    
}
@end









