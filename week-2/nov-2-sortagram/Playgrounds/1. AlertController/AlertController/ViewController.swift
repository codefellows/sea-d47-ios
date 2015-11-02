//
//  ViewController.swift
//  AlertController
//
//  Created by Michael Babiy on 10/18/15.
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

    @IBAction func alertViewButtonSelected(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Alert Controller", message: "This is the alert view.", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            print("User selected Cancel...")
        }
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
            print("User selected OK...")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func actionSheetButtonSelected(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Action Sheet Controller", message: "This is the action sheet.", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            print("User selected Cancel...")
        }
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
            print("User selected OK...")
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Destructive) { (action) -> Void in
            print("User selected Delete...")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        alertController.addAction(deleteAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    

}

