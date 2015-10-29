//
//  DetailViewController.swift
//  MBParallaxScrollView
//
//  Created by Michael Babiy on 5/19/15.
//  Copyright (c) 2015 Michael Babiy. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var exerpt: UILabel!
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var comments: UILabel!
    
    var post: Post!
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let varname1, varname2 = (23, 445)
    
    func setup() {
        self.navigationItem.title = self.post.title
        
        if self.post.mimeType == "video/mp4" {
            let player = AVPlayer(URL: NSURL(string: self.post.imageURLString)!)
            let playerController = AVPlayerViewController()
            playerController.player = player
            self.addChildViewController(playerController)
            self.view.addSubview(playerController.view)
            playerController.view.frame = self.view.frame
            player.play()
            
            self.exerpt.text = self.post.excerpt?.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
            self.imageView.image = self.image
            self.tags.text = self.tagString()
            self.comments.text = self.commentString()
            
        } else {
            self.exerpt.text = self.post.excerpt?.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
            self.imageView.image = self.image
            self.tags.text = self.tagString()
            self.comments.text = self.commentString()
        }
    }
    
    func tagString() -> String {
        var tagsString = String()
        if let allTags = self.post.tags {
            for tag in allTags {
                tagsString = "\(tagsString) - \(tag)"
            }
        }
        return tagsString
    }
    
    func commentString() -> String {
        var commentsString = String()
        if let allComments = self.post.comments {
            for comment in allComments {
                commentsString = "\(commentsString) - \(comment)"
            }
        }
        return commentsString
    }

}
