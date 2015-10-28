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
                        
                        let isRetweet = self.isRetweet(tweetObject)
                        if isRetweet.0 == true {
                            if let retweetObject = isRetweet.1 {
                                if let retweetText = retweetObject["text"] as? String, retweetUser = retweetObject["user"] as? [String : AnyObject] {
                                    if let retweetUser = userFromData(retweetUser), user = userFromData(user) {
                                        let tweet = Tweet(text: text, rqText: retweetText, id: id, user: user, rqUser: retweetUser, isRetweet: true)
                                        tweets.append(tweet)
                                    }
                                }
                            }
                        } else {

                            // Older code.
                            
                            let tweet = Tweet(text : text, id : id)
                            if let name = user["name"] as? String, profileImageURL = user["profile_image_url"] as? String {
                                tweet.user = User(name: name, profileImageURL: profileImageURL)
                            }
                            
                            tweets.append(tweet)
                        }
                    }
                }
                
                return tweets
            }
            
        } catch _ {
            
            return nil
            
        }
        
        return nil;
    }
    
    // MARK: Helper Functions
    
    class func isRetweet(tweetObject: [String : AnyObject]) -> (Bool, [String : AnyObject]?) {
        if let retweetObject  = tweetObject["retweeted_status"] as? [String : AnyObject] {
            if let _ = retweetObject["text"] as? String, _ = retweetObject["user"] as? [String : AnyObject] {
                return (true, retweetObject)
            }
        }
        
        return (false, nil)
    }
    
    class func isQuote(tweetObject: [String : AnyObject]) -> Bool {
        if let quoteStatus = tweetObject["is_quote_status"] as? Bool where quoteStatus == true {
            if let quoteData = tweetObject["quoted_status"] as? [String : AnyObject] {
                if let _ = quoteData["text"] as? String, _ = quoteData["user"] as? [String : AnyObject] {
                    return true
                }
            }
            
        }
        
        return false
    }
    
    class func userFromData(user : [String : AnyObject]) -> User? {
        if let name = user["name"] as? String, profileImageURL = user["profile_image_url"] as? String {
            return User(name: name,  profileImageURL: profileImageURL)
        }
        
        return nil
    }

}