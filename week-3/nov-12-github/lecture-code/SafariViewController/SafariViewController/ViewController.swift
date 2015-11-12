//
//  ViewController.swift
//  SafariViewController
//
//  Created by Michael Babiy on 11/12/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func safariViewControllerButtonSelected(sender: UIButton) {
        let safariViewController = SFSafariViewController(URL: NSURL(string: "https://www.pr0x7.com")!, entersReaderIfAvailable: true)
        safariViewController.delegate = self
        self.presentViewController(safariViewController, animated: true, completion: nil)
    }
    
    // MARK: SFSafariViewControllerDelegate
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

}

