//
//  Tweet.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/15/15.
//  Copyright (c) 2015 Michael Babiy. All rights reserved.
//

import UIKit

class Tweet {
    
    let text: String
    let id: String
    var user: User?
    
    let rqText: String?
    let rqUser: User?
    
    var isRetweet: Bool
    
    init(text : String, rqText: String? = nil, id : String, user: User? = nil, rqUser: User? = nil, isRetweet: Bool = false) {
        self.text =  text
        self.id = id
        self.user = user
        self.isRetweet = isRetweet
        self.rqUser = rqUser
        self.rqText = rqText
    }
    
}



