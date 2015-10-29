//
//  User.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/16/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class User {
    
    let name: String
    let profileImageURL: String
    var image: UIImage?
    
    init(name: String, profileImageURL: String) {
        self.name = name
        self.profileImageURL = profileImageURL
    }
    
}