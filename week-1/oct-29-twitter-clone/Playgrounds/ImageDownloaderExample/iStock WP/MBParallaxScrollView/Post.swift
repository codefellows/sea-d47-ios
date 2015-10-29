//
//  Post.swift
//  MBParallaxScrollView
//
//  Created by Michael Babiy on 5/19/15.
//  Copyright (c) 2015 Michael Babiy. All rights reserved.
//

import UIKit

class Post {
    
    let author: String!
    let excerpt: String?
    let imageURLString: String!
    let title: String!
    var image: UIImage?
    var tags: [String]?
    var comments: [String]?
    var mimeType: String!
    
    init(title: String, author: String, excerpt: String?, imageURLString: String, tags: [String]?, comments: [String]?, mimeType: String!) {
        self.author = author
        self.excerpt = excerpt
        self.imageURLString = imageURLString
        self.title = title
        self.tags = tags
        self.comments = comments
        self.mimeType = mimeType
    }
    
}
