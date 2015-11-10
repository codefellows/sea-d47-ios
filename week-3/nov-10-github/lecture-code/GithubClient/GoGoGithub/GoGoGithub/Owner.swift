//
//  Owner.swift
//  GoGoGithub
//
//  Created by Michael Babiy on 10/22/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import Foundation

class Owner {
    
    let login: String
    let avatarUrl: String
    let id: Int
    let url: String
    
    init(login: String, avatarUrl: String, id: Int, url: String) {
        self.login = login
        self.avatarUrl = avatarUrl
        self.id = id
        self.url = url
    }
    
}