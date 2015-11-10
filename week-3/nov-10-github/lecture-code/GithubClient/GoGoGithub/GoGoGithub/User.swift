//
//  User.swift
//  GoGoGithub
//
//  Created by Michael Babiy on 10/22/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import Foundation

class User {
    
    let name: String
    let login: String
    let location: String?
    let blog: String?
    let createdAt: NSDate
    let followers: Int
    
    init(name: String, login: String, location: String?, blog: String?, createdAt: NSDate, followers: Int) {
        self.name = name
        self.login = login
        self.location = location
        self.blog = blog
        self.createdAt = createdAt
        self.followers = followers
    }
}