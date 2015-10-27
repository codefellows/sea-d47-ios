//
//  TweetJSONParser.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/15/15.
//  Copyright (c) 2015 Michael Babiy. All rights reserved.
//

import Foundation

class TweetJSONParser {
    
    class func TweetFromJSONData(jsonData: NSData) -> [Tweet]? {
        do {
            
            if let rootObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? [[String : AnyObject]] {
                var tweets = [Tweet]()
                for tweetObject in rootObject {
                    
                    if let text = tweetObject["text"] as? String, id  = tweetObject["id_str"] as? String, user = tweetObject["user"] as? [String : AnyObject] {
                        
                        let tweet = Tweet(text : text, id : id)
                        
                        if let name = user["name"] as? String, profileImageURL = user["profile_image_url"] as? String {
                            tweet.user = User(name: name, profileImageURL: profileImageURL)
                        }
                        
                        // Append newely created tweets.
                        tweets.append(tweet)
                    }
                }
                
                return tweets
            }
            
        } catch _ {
            
            return nil
            
        }
        
        return nil;
    }
    
    
    class func userFromData(user : [String : AnyObject]) -> User? {
        if let name = user["name"] as? String,
            profileImageURL = user["profile_image_url"] as? String {
                return User(name: name,  profileImageURL: profileImageURL)
        }
        
        return nil
    }

}