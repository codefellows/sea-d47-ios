//
//  TabBarViewController.swift
//  TwitterCF
//
//  Created by Jeff Jacka on 8/9/15.
//  Copyright (c) 2015 Jeffrey Jacka. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func tabBar(tabBar: UITabBar, didBeginCustomizingItems items: [AnyObject]) {
        self.view.tintColor = UIColor.redColor()
    }

}
