//
//  AppDelegate.swift
//  GoGoGithub
//
//  Created by Michael Babiy on 10/21/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var oauthViewController: OAuthViewController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.checkOAuthStatus()
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        MBGithubOAuth.shared.tokenRequestWithCallback(url, options: SaveOptions.UserDefaults) { (success) -> () in
            if success {
                if let oauthViewController = self.oauthViewController {
                    oauthViewController.processOauthRequest()
                }
            }
        }
        
        return true
    }
    
    // MARK: Setup
    
    func checkOAuthStatus() {
        
        do {
            
            let token = try MBGithubOAuth.shared.accessToken()
            print(token)
            
        } catch _ { self.presentOAuthViewController() }
        
    }
    
    func presentOAuthViewController() {
        if let homeViewController = self.window?.rootViewController as? HomeViewController, storyboard = homeViewController.storyboard {
            if let oauthViewController = storyboard.instantiateViewControllerWithIdentifier(OAuthViewController.identifier()) as? OAuthViewController {
                homeViewController.addChildViewController(oauthViewController)
                homeViewController.view.addSubview(oauthViewController.view)
                oauthViewController.didMoveToParentViewController(homeViewController)
                oauthViewController.oauthCompletionHandler = ({
                    UIView.animateWithDuration(kDefaultAnimationDuration, delay: 1.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                        oauthViewController.view.alpha = 0.0
                        }, completion: { (finished) -> Void in
                            oauthViewController.view.removeFromSuperview()
                            oauthViewController.removeFromParentViewController()
                            
                            // Make the call for repositories.
                            homeViewController.update()
                    })
                })
                
                // We need a pointer to our OAuthViewController for application:sourceApplication:annotation:
                self.oauthViewController = oauthViewController
            }
        }
        
    }

}

