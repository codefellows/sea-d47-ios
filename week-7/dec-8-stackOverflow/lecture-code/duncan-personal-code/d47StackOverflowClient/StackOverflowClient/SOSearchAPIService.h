//
//  SOSearchAPIService.h
//  StackOverflowClient
//
//  Created by nacnud on 12/6/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
// un neccisary for lecture ask students if they want to see per endpoint settings ?
typedef enum {
    Activity,
    Votes,
    Creation,
    Relevance
} Sort ;

typedef enum {
    Decending,
    Ascending
} Order;

@interface SOSearchAPIService : NSObject

@property Sort sort;
@property Order order;

+(SOSearchAPIService * _Nonnull) sharedService;

-(void )searchWithTearm:(NSString * _Nonnull)searchTermParam withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;

-(void) searchWithTearm:(NSString * _Nonnull)searchTerm pageNumber:(int)pageNumber withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;

-(void) searchSimilarWithTearm:(NSString * _Nonnull)searchTermParam pageNumber:(int)pageNumberParam withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;

@end






