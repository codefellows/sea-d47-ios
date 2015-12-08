//
//  OAuthWebViewController.m
//  StackOverflowClient
//
//  Created by Adam Wallraff on 12/2/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import "OAuthWebViewController.h"

@import WebKit;

NSString const *kClientID = @"6085";
NSString const *kBaseURL = @"https://stackexchange.com/oauth/dialog?";
NSString const *kRedirectURI = @"https://stackexchange.com/oauth/login_success";

@interface OAuthWebViewController () <WKNavigationDelegate, UINavigationControllerDelegate> 

@property(strong, nonatomic) WKWebView *webView;


@end

@implementation OAuthWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    
    self.webView.navigationDelegate = self;
    
    NSString *stackURLString = [NSString stringWithFormat:@"%@client_id=%@&redirect_uri=%@&scope=private_info", kBaseURL, kClientID, kRedirectURI];
    
    NSURL *stackURL = [NSURL URLWithString:stackURLString];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:stackURL]];
    
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    NSURLRequest *request = navigationAction.request;
    NSURL *requestURL = request.URL;
    
    if([requestURL.description containsString:@"access_token"]){
//        NSArray *urlComponents = [[requestURL description] componentsSeparatedByString:@"="];
//        NSLog(@"urlcompentes list: %@", urlComponents.description);
//        NSString *accessToken = urlComponents.lastObject;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSArray *description = [[requestURL description] componentsSeparatedByString:@"access_token="];
        NSString *authTokenAndExpiration = description.lastObject;
        NSString *authToken = [authTokenAndExpiration componentsSeparatedByString:@"&"].firstObject;
        
        
        [userDefaults setObject:authToken forKey:@"accessToken"];
        [userDefaults synchronize];
        
        if (self.completion) {
            self.completion();
        }
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end
