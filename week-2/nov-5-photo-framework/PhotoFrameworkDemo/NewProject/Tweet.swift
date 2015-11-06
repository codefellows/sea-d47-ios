//
//  Tweet.swift
//  NewProject
//
//  Created by Michael Babiy on 11/4/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class Tweet {
    
    var image: UIImage?
    let text: String
    
    init(text: String, image: UIImage?) {
        self.text = text
        self.image = image
    }
    
}