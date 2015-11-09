//
//  AppDelegate.swift
//  MBGithubOAuth
//
//  Created by Michael Babiy on 10/20/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        MBGithubOAuth.shared.tokenRequestWithCallback(url, options: SaveOptions.UserDefaults) { (success) -> () in
            if success {
                print("We have token.")
            }
        }
        
        return true
    }
    
}

