//
//  API.swift
//  MBParallaxScrollView
//
//  Created by Michael Babiy on 5/19/15.
//  Copyright (c) 2015 Michael Babiy. All rights reserved.
//

import Foundation

class API {
    
    class func getRecent(completion: (posts: [Post]) -> ()) {
        
        var recent = [Post]()
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        
        session.dataTaskWithURL(NSURL(string: "http://www.hapticguides.com/?json=get_recent_posts")!, completionHandler: { (data, response, error) -> Void in
            let JSON = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! [NSObject : AnyObject]
            let postsJSONArray = JSON["posts"] as! [AnyObject]
            
            for postJSON in postsJSONArray {
                
                var tags = [String]()
                if let tagsJSON = postJSON["tags"] as? [[NSObject : AnyObject]] {
                    for tag in tagsJSON {
                        if let title = tag["title"] as? String {
                            tags.append(title)
                        }
                    }
                }
                
                var comments = [String]()
                if let commentsJSON = postJSON["comments"] as? [[NSObject : AnyObject]] {
                    for comment in commentsJSON {
                        if let content = comment["content"] as? String {
                            comments.append(content.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil))
                        }
                    }
                }
                
                let title = postJSON["title"] as! String
                let excerpt = postJSON["excerpt"] as? String ?? ""
                let author = postJSON["author"] as! NSDictionary
                let name = author["name"] as! String
                let attachments = postJSON["attachments"] as! [AnyObject]
                
                if let attachemnt = attachments.first as? NSDictionary {
                    let mimeType = attachemnt["mime_type"] as! String
                    recent.append(Post(title: title, author: name, excerpt: excerpt, imageURLString: attachemnt["url"] as! String, tags: tags, comments: comments, mimeType: mimeType))
                }
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(posts: recent)
            })
        }).resume()
    }
    
}