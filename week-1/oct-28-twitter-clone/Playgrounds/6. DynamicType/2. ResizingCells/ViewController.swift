//
//  ViewController.swift
//  2. ResizingCells
//
//  Created by Michael Babiy on 10/16/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

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
        self.tableView.estimatedRowHeight = 10.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "Bacon ipsum dolor amet pancetta spare ribs dolore dolore lorem deserunt tail prosciutto short loin laboris. Meatloaf short ribs ut est beef esse ut. Kielbasa ex andouille fatback, voluptate doner capicola pork belly sunt cow alcatra incididunt hamburger. Quis veniam dolore reprehenderit turducken esse tri-tip pastrami pariatur ex ball tip adipisicing. Boudin quis ball tip laboris duis kielbasa dolore, alcatra occaecat anim."
        return cell
    }

}

