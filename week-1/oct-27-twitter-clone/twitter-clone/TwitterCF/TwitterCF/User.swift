//
//  User.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/16/15.
//  Copyright © 2015 Jeffrey Jacka. All rights reserved.
//

import Foundation

class User {
    
    let name: String
    let profileImageURL: String
    
    init(name: String, profileImageURL: String) {
        self.name = name
        self.profileImageURL = profileImageURL
    }
    
}