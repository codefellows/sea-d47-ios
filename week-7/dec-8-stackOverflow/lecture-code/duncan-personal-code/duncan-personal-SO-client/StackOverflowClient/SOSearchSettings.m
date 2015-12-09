//
//  SOSearchSettings.m
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import "SOSearchSettings.h"

@implementation SOSearchSettings
#pragma mark - class methods

+(SOSearchSettings * )sharedService{
    static SOSearchSettings *sharedService;
    if (!sharedService){
        sharedService = [[SOSearchSettings alloc] init];
        return sharedService;
    }
    return sharedService;
}

#pragma mark -instance methods
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

-(NSString *) getSortParameterForUrl{
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

-(NSString *) getOrderParameterForUrl{
    switch (self.order) {
        case Decending:
            return @"desc";
            break;
        case Ascending:
            return @"asc";
            break;
        default:
            return @"desc";
            break;
    }
}


@end
