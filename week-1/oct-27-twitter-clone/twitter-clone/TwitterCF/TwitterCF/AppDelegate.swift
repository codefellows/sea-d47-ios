//
//  AppDelegate.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/15/15.
//  Copyright (c) 2015 Michael Babiy. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.setupAppearance()
        return true
    }
    
    func setupAppearance() {
        UITabBar.appearance().tintColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
    }
}

