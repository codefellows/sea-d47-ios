//
//  ModelExtensions.swift
//  GoGoGithub
//
//  Created by Michael Babiy on 10/22/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import Foundation

enum ModelError: ErrorType {
    case ProcessingStringIntoDate
}

typealias ModelExtensionsCompletionHandler = (success: Bool, object: AnyObject?) -> ()

extension Owner {
    
    class func ownerWith(json: [String : AnyObject]) -> Owner? {
        
        if let login = json["login"] as? String, avatarUrl = json["avatar_url"] as? String, id = json["id"] as? Int, url = json["url"] as? String {
            return Owner(login: login, avatarUrl: avatarUrl, id: id, url: url)
        }
        
        return nil
    }
    
}

extension Repository {
    
    class func update(completion: (success: Bool, repositories:[Repository]?) -> ()) {
        
        API.enqueue(GETRespositoriesRequest()) { (success, json) -> () in
            
            var repositories = [Repository]()
            
            for eachRepository in json {
                
                if let name = eachRepository["name"] as? String, id = eachRepository["id"] as? Int, openIssues = eachRepository["open_issues_count"] as? Int, url = eachRepository["url"] as? String {
                 
                    let description = eachRepository["description"] as? String
                    let createdAt = NSDate.dateFromString(eachRepository["created_at"] as! String)
                    let language = eachRepository["language"] as? String
                    let owner = Owner.ownerWith(eachRepository["owner"] as! [String : AnyObject])
                    
                    let repository = Repository(name: name, description: description, id: id, createdAt: createdAt, openIssues: openIssues, url: url, language: language, owner: owner)
                    repositories.append(repository)
                }
            }
            
            completion(success: true, repositories: repositories)
        }
        
    }
    
}

extension User {
    
    class func udpate(completion: (success: Bool, user: User?) -> ()) {
        
        /*
            This is based on the assumption and trust between Github
            and me. The trust is that the User information will always
            be returned as a dictionary that I later wrap in a array to
            account for repositories (completion declaration) for the API class.
        
            The other assumption is that the created_at will alway be returned
            as a string in this format yyyy-MM-dd'T'HH:mm:ss'Z'.
        */
        
        API.enqueue(GETUser()) { (success, object) -> () in
            if let json = object.first {
                
                if let name = json["name"] as? String, login = json["login"] as? String, followers = json["followers"] as? Int {
                    
                    let createdAt = NSDate.dateFromString(json["created_at"] as! String)
                    let location = json["location"] as? String
                    let blog = json["blog"] as? String
                    
                    let user = User(name: name, login: login, location: location, blog: blog, createdAt: createdAt, followers: followers)
                    completion(success: true, user: user)
                }
            }
            completion(success: false, user: nil)
        }
    }
    
}
