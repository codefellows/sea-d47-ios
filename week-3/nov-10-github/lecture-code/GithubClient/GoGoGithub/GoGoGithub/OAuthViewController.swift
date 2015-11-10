//
//  OAuthViewController.swift
//  GoGoGithub
//
//  Created by Michael Babiy on 10/22/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

typealias OAuthViewControllerCompletionHandler = () -> ()

class OAuthViewController: UIViewController {
    
    var oauthCompletionHandler: OAuthViewControllerCompletionHandler?
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    class func identifier() -> String {
        return "OAuthViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupAppearance() {
        self.loginButton.layer.cornerRadius = 3.0
    }
    
    func processOauthRequest() {
        if let oauthCompletionHandler = self.oauthCompletionHandler {
            oauthCompletionHandler()
        }
    }
    
    @IBAction func loginButtonSelected(sender: UIButton) {
        self.activityIndicatorView.startAnimating()
        NSOperationQueue().addOperationWithBlock { () -> Void in
            usleep(1000000)
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                // GithubOAuth.shared.oauthRequestWithScope("email,user,repo")
            })
        }
    }

}
