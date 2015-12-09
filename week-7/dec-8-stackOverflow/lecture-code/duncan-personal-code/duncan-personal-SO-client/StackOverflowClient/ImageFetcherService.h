//
//  ImageFetcherService.h
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constants.h"


@interface ImageFetcherService : NSObject
+(void)fetchImageInBackgroundFromUrl:(NSURL * _Nonnull)url completionHandler:(kNSImageCompletionHandler)completionHandler;

@end
