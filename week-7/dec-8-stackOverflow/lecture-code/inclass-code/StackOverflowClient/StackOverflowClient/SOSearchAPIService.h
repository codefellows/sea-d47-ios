//
//  SOSearchAPIService.h
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"


@interface SOSearchAPIService : NSObject
+(void)searchWithTerm:(NSString* )searchTerm pageNumber:(int)pageNumber withCompletion:(kNSDictionaryCompletionHandler)completion;
@end
