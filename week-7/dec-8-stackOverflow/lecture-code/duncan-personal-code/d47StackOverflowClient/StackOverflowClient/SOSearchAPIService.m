//
//  SOSearchAPIService.m
//  StackOverflowClient
//
//  Created by nacnud on 12/6/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import "SOSearchAPIService.h"
#import "JSONAPIRequestService.h"

@implementation SOSearchAPIService
NSString *kSOAPIBaseURL = @"https://api.stackexchange.com/2.2/";

#pragma mark class methods
+(SOSearchAPIService * )sharedService{
    static SOSearchAPIService *sharedService;
    if (!sharedService){
        sharedService = [[SOSearchAPIService alloc] init];
        return sharedService;
    }
    return sharedService;
}

#pragma mark private Methods

-(id)init
{
    if (self = [super init])
    {
        // Initializselation code here
        [self setSort: Activity];
        [self setOrder:Decending];
        
    }
    return self;
}

-(NSString *) getSortForURLParam{
    switch (self.sort) {
        case Activity:
            return @"activity";
            break;
        case Creation:
            return @"creation";
            break;
        case Relevance:
            return @"relevance";
            break;
        case Votes:
            return @"votes";
            break;
        default:
            return @"activity";
            break;
    }
}

-(NSString *) getOrderForURLParam{
    switch (self.order) {
        case Activity:
            return @"desc";
            break;
        case Creation:
            return @"asc";
            break;
        default:
            return @"desc";
            break;
    }
}

#pragma mark public Methods


-(void )searchWithTearm:(NSString * _Nonnull)searchTermParam withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler {
    [self searchWithTearm:searchTermParam pageNumber:1 withCompletion:completionHandler];
}

-(void) searchWithTearm:(NSString * _Nonnull)searchTermParam pageNumber:(int)pageNumberParam withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler {
    
    NSString *searchUrlString = [NSString stringWithFormat:@"%@search", kSOAPIBaseURL];
    NSString *sortParam = [self getSortForURLParam];
    NSString *orderParam = [self getOrderForURLParam];
    NSString *pageNumber;
    
    if (pageNumberParam > 0) {
        pageNumber = [NSString stringWithFormat:@"%d", pageNumberParam];
    } else {
        pageNumber = [NSString stringWithFormat:@"%d", 1];
    }
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:pageNumber forKey:@"page"];
    [parameters setObject:sortParam forKey:@"sort"];
    [parameters setObject:orderParam forKey:@"order"];
    [parameters setObject:searchTermParam forKey:@"intitle"];
    [parameters setObject:@"stackoverflow" forKey:@"site"];
    
    [JSONAPIRequestService getRequestWithURL:searchUrlString parameters:(NSDictionary*)parameters withCompletion:^(NSData * _Nullable data, NSError * _Nullable error) {
        [self dictionaryCompletionHelperWithData:data withError:error withCompetionHandler:completionHandler];
    }];
}

-(void) searchSimilarWithTearm:(NSString * _Nonnull)searchTermParam pageNumber:(int)pageNumberParam withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler {
    
    NSString *searchUrlString = [NSString stringWithFormat:@"%@similar", kSOAPIBaseURL];
    NSString *sortParam = [self getSortForURLParam];
    NSString *orderParam = [self getOrderForURLParam];
    NSString *pageNumber;
    if (pageNumberParam > 0) {
       pageNumber = [NSString stringWithFormat:@"%d", pageNumberParam];
    } else {
       pageNumber = [NSString stringWithFormat:@"%d", 1];
    }

    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:pageNumber forKey:@"page"];
    [parameters setObject:sortParam forKey:@"sort"];
    [parameters setObject:orderParam forKey:@"order"];
    [parameters setObject:searchTermParam forKey:@"title"];
    [parameters setObject:@"stackoverflow" forKey:@"site"];
    
    [JSONAPIRequestService getRequestWithURL:searchUrlString parameters:(NSDictionary*)parameters withCompletion:^(NSData * _Nullable data, NSError * _Nullable error) {
        [self dictionaryCompletionHelperWithData:data withError:error withCompetionHandler:completionHandler];
    }];
}

#pragma mark - completion handler conversion helpers
-(void) dictionaryCompletionHelperWithData:(NSData *)data withError:(NSError *)error withCompetionHandler:(kNSDictionaryCompletionHandler)completionHandler {
    
    if (error == nil) {
        NSDictionary *dictionary = (NSDictionary*) data;
        completionHandler(dictionary, nil);
        return;
    }
    completionHandler(nil, error);
}

-(void) arrayCompletionHelperWithData:(NSData *)data withError:(NSError *)error withCompetionHandler:(kNSArrayCompletionHandler)completionHandler {
    
    if (error == nil) {
        NSArray *array = (NSArray*) data;
        completionHandler(array, nil);
        return;
    }
    completionHandler(nil, error);
}


@end
