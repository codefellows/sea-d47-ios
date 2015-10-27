//
//  ViewController.swift
//  5. HTTP Response Codes
//
//  Created by Michael Babiy on 10/16/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var responseTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.printServerResponse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func printServerResponse() {
        
        let googleURL = NSURL(string: "https://www.google.com")!
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithURL(googleURL) { (data, response, error) -> Void in
            if error == nil {
                
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.responseTextView.text = response?.description
                })
                
                // Mention this.
                
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    self.responseTextView.text = response?.description
//                })
                
                
                // To get the response code, if you are interested, youll need to cast response into NSHTTPResponse like so:
                
//                if let response = response as? NSHTTPURLResponse {
//                    print("Status code: \(response.statusCode)")
//                }
                
            }
            

            
        }.resume()
        
    }


}

