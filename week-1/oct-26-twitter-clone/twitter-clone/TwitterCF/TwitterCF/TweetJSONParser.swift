//
//  TweetJSONParser.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/26/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import Foundation

class TweetJSONParser {
    
    class func tweetFromJSONData(json: NSData) -> [Tweet]? {
        
        do {
            
            if let rootObject = try NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.MutableContainers) as? [[String : AnyObject]] {
                
                print(rootObject)
                
                var tweets = [Tweet]()
                
                for tweetObject in rootObject {
                    
                    
                    if let text = tweetObject["text"] as? String, id = tweetObject["id_str"] as? String {
                        
                        let tweet = Tweet(text: text, id: id)
                        tweets.append(tweet)
                    }
                }
                
                return tweets
            }
        } catch _ {}
        
        return nil
    }
    
}