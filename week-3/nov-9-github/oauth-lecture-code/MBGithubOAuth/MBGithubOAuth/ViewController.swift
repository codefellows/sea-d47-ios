//
//  ViewController.swift
//  MBGithubOAuth
//
//  Created by Michael Babiy on 10/20/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func requestToken(sender: UIButton) {
        MBGithubOAuth.shared.oauthRequestWith(["scope" : "email,user"])
    }

    @IBAction func printToken(sender: UIButton) {
        
        do {
            let token = try MBGithubOAuth.shared.accessToken()
            
            print(token)
            
        } catch let error {
            
            print(error)
            
        }
        
    }
}

