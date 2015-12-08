//
//  SOMeQuestionsAPIService.h
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOMeQuestionsAPIService : NSObject
+(void )fetchMyQuestionswithCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;
@end
