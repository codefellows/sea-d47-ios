//
//  SOSearchSettings.h
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
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

@interface SOSearchSettings : NSObject
@property Sort sort;
@property Order order;

+(SOSearchSettings * _Nonnull) sharedService;

-(NSString *) getSortParameterForUrl;
-(NSString *) getOrderParameterForUrl;

@end
