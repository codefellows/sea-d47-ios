//
//  JSONAPIRequestService.m
//  StackOverflowClient
//
//  Created by nacnud on 12/6/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import "JSONAPIRequestService.h"
#import "AFNetworking.h"

@implementation JSONAPIRequestService

+(void) setupManagerReachabilityChangeBlock:(AFHTTPRequestOperationManager*)manager {
    NSOperationQueue *managerOPQueue = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [managerOPQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [managerOPQueue setSuspended:YES];
                UIViewController *topVC = [[UIApplication sharedApplication].windows firstObject].rootViewController;
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Connection ERROR" message:@"You gots not internetz Bu" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:ok];
                [topVC presentViewController:alert animated:true completion:nil];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
}

+(void )getRequestWithURL:(NSString * _Nonnull)url parameters:(NSDictionary*)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [self setupManagerReachabilityChangeBlock:manager];

    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSData *data = (NSData*) responseObject;
        completionHandler(data, nil);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        completionHandler(nil, error);

    }];
}

+(void)postRequestWithURL:(NSString * _Nonnull)url parameters:(NSDictionary* _Nullable)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [self setupManagerReachabilityChangeBlock:manager];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSData *data = (NSData*) responseObject;
        completionHandler(data, nil);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        completionHandler(nil, error);
        
    }];
}

+(void)imageRequestWithURL:(NSString * _Nonnull)url withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFImageResponseSerializer serializer];
    [self setupManagerReachabilityChangeBlock:manager];
    [manager POST:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSData *data = (NSData*) responseObject;
        completionHandler(data, nil);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        completionHandler(nil, error);
    }];
}

#pragma mark - Working With JSON
+( NSData* ) serializeJSONFromDictionary:(NSDictionary* _Nonnull)dictionary {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    return jsonData;
}

// show people how much work using AFHTTPRequestOperation is


//+(void)deleteRequestWithURL:(NSString * _Nonnull)url parameters:(NSDictionary* _Nullable)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler {
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"DELETE"];
//    
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    
//    if (parameters != nil){
//        [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
//        NSData *jsonData = [self serializeJSONFromDictionary: parameters];
//        [request setHTTPBody: jsonData];
//    }
//    
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        NSData *data = (NSData*) responseObject;
//        completionHandler(data, nil);
//        
//    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//        completionHandler(nil, error);
//    }];
//    
//    [operation start];
//}




@end
