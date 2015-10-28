//
//  TweetDetailViewController.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/16/15.
//  Copyright © 2015 Michael Babiy All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    @IBOutlet weak var tweetLabel: UILabel!
    
    var tweet: Tweet!
    
    class func indentifier() -> String {
        return "TweetDetailViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearance()
        self.setupTweetDetailViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupAppearance() {
        if self.tweet.isRetweet {
            if let rqUser = self.tweet.rqUser {
                self.navigationItem.title = rqUser.name
            } else {
                self.navigationItem.title = self.tweet.user?.name
            }
        }
        
        if let user = self.tweet.user {
            self.navigationItem.title = user.name
        }
    }
    
    func setupTweetDetailViewController() {
        self.tweetLabel.text = self.tweet.isRetweet ? self.tweet.rqText : self.tweet.text
    }

}
