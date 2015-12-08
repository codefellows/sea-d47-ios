//
//  JSONRequestService.m
//  StackOverflowClient
//
//  Created by nacnud on 12/8/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import "JSONRequestService.h"
#import "AFNetworking.h"


@implementation JSONRequestService
+(void)getRequsetWithURL:(NSString* _Nonnull)url parameters:(NSDictionary *_Nullable)parameters withCompletion:(kNSDataCompletionHandler)completion {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSOperationQueue *managerQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [managerQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [managerQueue setSuspended:YES];
                UIViewController *topVC = [[UIApplication sharedApplication].windows firstObject].rootViewController;
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Connection ERROR" message:@"You gots not internetz Bu" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:ok];
                [topVC presentViewController:alert animated:true completion:nil];
                break;
        }

    }];
    
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSData *data = (NSData*)responseObject;
        completion(data, nil);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        completion(nil, error);
    }];
    
}
@end










