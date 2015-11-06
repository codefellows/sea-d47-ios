//
//  ViewController.swift
//  Delegation
//
//  Created by Michael Babiy on 11/5/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewStatusViewControllerDelegate {
    
    var datasource = [Status]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.generateStatuses()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTableView() {
        self.tableView.estimatedRowHeight = 25.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    func generateStatuses() {
        
        var statusArray = [Status]()
        
        for _ in 0...1 {
            statusArray.append(Status(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."))
        }
        
        // Assing once when the data is ready.
        self.datasource = statusArray
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == NewStatusViewController.identifier() {
            let newStatusViewController = segue.destinationViewController as! NewStatusViewController
            newStatusViewController.delegate = self
        }
    }
    
    // MARK: Table View.
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let statusCell = tableView.dequeueReusableCellWithIdentifier("StatusCell", forIndexPath: indexPath)
        let status = self.datasource[indexPath.row]
        statusCell.textLabel?.text = status.text
        return statusCell
    }
    
    // MARK: NewStatusViewController Delegate
    
    func newStatusViewControllerDidFinishWith(status: Status) {
        self.datasource.append(status)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

