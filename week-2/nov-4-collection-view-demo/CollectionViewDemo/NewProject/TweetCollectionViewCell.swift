//
//  TweetCollectionViewCell.swift
//  NewProject
//
//  Created by Michael Babiy on 11/4/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class TweetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var tweet: Tweet? {
        didSet {
            if let tweet = self.tweet {
                self.imageView.image = tweet.image
            }
        }
    }
    
    class func identifier() -> String {
        return "TweetCollectionViewCell"
    }
    
}
