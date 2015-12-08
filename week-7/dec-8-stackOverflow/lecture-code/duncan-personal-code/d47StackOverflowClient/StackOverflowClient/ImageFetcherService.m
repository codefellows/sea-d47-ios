//
//  ImageFetcherService.m
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import "ImageFetcherService.h"

@implementation ImageFetcherService

+(void)fetchImageInBackgroundFromUrl:(NSURL * _Nonnull)url completionHandler:(kNSImageCompletionHandler)completionHandler {

    dispatch_queue_t imageQueue = dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(imageQueue, ^{
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:url options: NSDataReadingUncached error:&error];
       
        UIImage *result = [[UIImage alloc] initWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error == nil && data != nil){
                completionHandler(result, nil);
                return;
            }
            
            if( error == nil && data == nil){
                NSError *error = [NSError errorWithDomain:@"Error: Image is nil" code:-1 userInfo:nil];
                completionHandler(nil, error);
                return;
            }
            
            completionHandler(nil, error);
        });
    });
}

@end
