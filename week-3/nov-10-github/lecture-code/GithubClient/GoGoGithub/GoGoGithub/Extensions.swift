//
//  Extensions.swift
//  this.place
//
//  Created by Michael Babiy on 9/30/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit
import CoreData

extension NSDate {
    
    class func dateFromString(string: String) -> NSDate {
        
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale.currentLocale()
        formatter.timeStyle = NSDateFormatterStyle.NoStyle
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        return formatter.dateFromString(string)!
    }
    
}

extension NSMutableURLRequest {
    
    class func requestWithAPIRequest(apiRequest: APIRequest) -> NSMutableURLRequest {
        let request = NSMutableURLRequest()
        var requestURL = NSURL(string: "\(apiRequest.url())?")!
        
        // Handle HTTP body.
        if let httpBody = apiRequest.httpBody() {
            request.HTTPBody = httpBody
        }
        
        // Handle parameters.
        if let apiQueries = apiRequest.queryStringParameters() {
            var queryArray = [String]()
            var queryString = String()
            
            for (key, value) in apiQueries {
                queryArray.append("\(key)=\(value)")
            }
            
            queryString = queryArray.joinWithSeparator("&")
            if let encodedHost = queryString.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
                requestURL = NSURL(string: "\(apiRequest.url())?".stringByAppendingString(encodedHost))!
            }
        }
    
        if let apiHeaders = apiRequest.httpHeaders() {
            for (key, value) in apiHeaders {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        request.URL = requestURL
        request.HTTPMethod = apiRequest.httpMethod.rawValue
        
        return request
    }
    
}

extension UINavigationItem {
    
    func showActivityIndicator() {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        activityIndicatorView.startAnimating()
        let activityBarButton = UIBarButtonItem(customView: activityIndicatorView)
        self.rightBarButtonItem = activityBarButton
    }
    
}