//
//  OAuthWebViewController.h
//  StackOverflowClient
//
//  Created by Adam Wallraff on 12/2/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OAuthWebViewControllerComletion)();

@interface OAuthWebViewController : UIViewController

@property (copy, nonatomic) OAuthWebViewControllerComletion completion;

@end
