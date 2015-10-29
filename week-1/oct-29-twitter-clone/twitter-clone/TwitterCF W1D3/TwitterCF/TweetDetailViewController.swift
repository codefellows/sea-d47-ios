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
    
    private lazy var detailLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(12)
        label.text = "Created by Michael"
        label.textColor = UIColor.blueColor()
        return label
    }()
    
    class func indentifier() -> String {
        return "TweetDetailViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAppearance()
        self.setupTweetDetailViewController()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.detailLabel)
        
        
        let centerX = NSLayoutConstraint(item: self.detailLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: self.detailLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -20.0)
        
        centerX.active = true
        bottom.active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupAppearance() {
        if self.tweet.isRetweet {
            if let rqUser = self.tweet.rqUser {
                self.navigationItem.title = rqUser.name
                return
            }
        }
        
        if let name = tweet.user?.name {
            self.navigationItem.title = name
        }
    }
    
    func setupTweetDetailViewController() {
        self.tweetLabel.text = self.tweet.isRetweet ? self.tweet.rqText : self.tweet.text
    }

}
