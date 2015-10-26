//
//  Tweet.swift
//  TwitterCF
//
//  Created by Michael Babiy on 10/26/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import Foundation

class Tweet {
    
    let text: String
    let id: String
    
    init(text: String, id: String) {
        self.text = text
        self.id = id
    }
}