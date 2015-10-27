//
//  Tweet.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/15/15.
//  Copyright (c) 2015 Michael Babiy. All rights reserved.
//

import UIKit

class Tweet {
    
    let text : String
    let id : String
    var user: User?
    
    init(text : String, id : String, user: User? = nil) {
        self.text =  text
        self.id = id
        self.user = user
    }
    
}



