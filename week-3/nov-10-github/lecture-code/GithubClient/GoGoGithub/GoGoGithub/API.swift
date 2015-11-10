//
//  API.swift
//  this.place
//
//  Created by Michael Babiy on 10/21/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

typealias APICompletionHandler = (success: Bool, json: [[String : AnyObject]]) -> ()

class API {
    
    // MARK: WEB
    
    class func enqueue(apiRequest: APIRequest, completion: APICompletionHandler) {
        let request = NSMutableURLRequest.requestWithAPIRequest(apiRequest)
        self.session().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                if let data = data {
                    do {
                        
                        // We are requesting repositories that come back as an array of dictionaries.
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [[String : AnyObject]] {
                            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                completion(success: true, json: json)
                            })
                        }
                        
                        // We are requesting current user information. Comes back as a dictionary.
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] {
                            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                completion(success: true, json: [json])
                            })
                        }
                        
                    } catch _ {}
                }
            }
        }).resume()
    }
    
    // MARK: Helper Functions
    
    class func configuration() -> NSURLSessionConfiguration {
        return NSURLSessionConfiguration.defaultSessionConfiguration()
    }
    
    class func session() -> NSURLSession {
        return NSURLSession(configuration: self.configuration())
    }
    
}