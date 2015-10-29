//
//  ViewController.swift
//  2. ResizingCells
//
//  Created by Michael Babiy on 10/16/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

/*
    USE DAY 3 NAVIGATIONCONTROLLER AS A STARTED PROJECT
*/

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTableView() {
        self.tableView.registerNib(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        self.tableView.estimatedRowHeight = 10.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // ... 
        let spinner = UIRefreshControl(frame: CGRectMake(0.0, 0.0, 44.0, 44.0))
        spinner.addTarget(self, action: "updateFeed:", forControlEvents: UIControlEvents.AllEvents)
        self.tableView.addSubview(spinner)
    }
    
    func updateFeed(sender: AnyObject) {
        
        // Simulate network call.
        
        NSOperationQueue().addOperationWithBlock { () -> Void in
            usleep(1000000)
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                if let spinner = sender as? UIRefreshControl {
                    spinner.endRefreshing()
                }
            })
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as! CustomTableViewCell
        cell.label.numberOfLines = 0
        cell.label.text = "Bacon ipsum dolor amet pancetta spare ribs dolore dolore lorem deserunt tail prosciutto short loin laboris. Meatloaf short ribs ut est beef esse ut. Kielbasa ex andouille fatback, voluptate doner capicola pork belly sunt cow alcatra incididunt hamburger. Quis veniam dolore reprehenderit turducken esse tri-tip pastrami pariatur ex ball tip adipisicing. Boudin quis ball tip laboris duis kielbasa dolore, alcatra occaecat anim."
        return cell
    }
    
    // Header View.
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HeaderView.view()
    }

}

