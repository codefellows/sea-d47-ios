//
//  ViewController.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/15/15.
//  Copyright (c) 2015 Michael Babiy. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweets = [Tweet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let customTweetCellXib = UINib(nibName: "CustomTweetCell", bundle: NSBundle.mainBundle())
        self.tableView.registerNib(customTweetCellXib, forCellReuseIdentifier: CustomTweetTableViewCell.identifier())

        self.setupTableView()
        self.getAccount()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // SupercoolCache.flush()
    }
    
    func getAccount() {
        LoginService.loginTwitter({ (error, account) -> () in
            if let error = error {
                print(error)
                return
            }
            
            if let account = account {
                TwitterService.sharedService.account = account
                self.authenticateUser()
            }
        })
    }
    
    func authenticateUser(){
        TwitterService.getAuthUser { (error, user) -> () in
            if let error = error {
                print(error)
                return
            }
            
            if let user = user {
                TwitterService.sharedService.user = user
                self.getTweets()
            }
        }
    }
    
    func getTweets() {
        TwitterService.tweetsFromHomeTimeline { (error, tweets) -> () in
            if let error = error {
                print(error)
                return
            }
            
            if let tweets = tweets {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.tweets = tweets
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    // MARK: Week 3 Class
    
    func setupTableView() {
        self.tableView.estimatedRowHeight = 10.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == TweetDetailViewController.indentifier() {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let tweet = self.tweets[indexPath.row]
                let tweetsDetailViewController = segue.destinationViewController as! TweetDetailViewController
                tweetsDetailViewController.tweet = tweet
            }
        }
    }
    
    // MARK: UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomTweetTableViewCell.identifier(), forIndexPath: indexPath) as! CustomTweetTableViewCell
        
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(TweetDetailViewController.indentifier(), sender: nil)
    }
}
