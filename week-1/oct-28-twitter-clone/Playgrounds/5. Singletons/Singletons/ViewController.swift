//
//  ViewController.swift
//  Singletons
//
//  Created by Michael Babiy on 10/16/15.
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
    
    @IBAction func testAwesomeClassAddress(sender: AnyObject) {
        print("Singleton Address: \(AwesomeClass.shared)")
        print("New Address: \(AwesomeClass())")
    }

}

