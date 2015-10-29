//
//  ViewController.swift
//  MBParallaxScrollView
//
//  Created by Michael Babiy on 7/9/14.
//  Copyright (c) 2014 Michael Babiy. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


//- cropped images (setting can be adjusted)
//- author: description, first and last name, nickname, slug and url
//- categories
//- comments count, comments


import UIKit
import AVFoundation
import AVKit

let parallaxCellIdentifier = "parallaxCell"

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setup() {
        // Custom bar...
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        // Execute a search.
        API.getRecent { (posts) -> () in
            self.posts = posts
            self.collectionView?.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailViewController" {
            let indexPath = (self.collectionView?.indexPathsForSelectedItems()!.first)! as NSIndexPath
            let detailViewController = segue.destinationViewController as! DetailViewController
            let post = self.posts[indexPath.row]
            let cell = self.collectionView?.cellForItemAtIndexPath(indexPath) as! ParallaxCollectionViewCell
            detailViewController.image = cell.imageView.image
            detailViewController.post = post
        }
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let parallaxCell = collectionView.dequeueReusableCellWithReuseIdentifier(parallaxCellIdentifier, forIndexPath: indexPath) as! ParallaxCollectionViewCell
        let post = self.posts[indexPath.row]
        parallaxCell.excert.text = "\(post.title)"
        
//        // Play cell.
//        self.playVideo(parallaxCell)
        
        parallaxCell.fetcher = ImageFetcher(imageURLString: post.imageURLString, imageView: parallaxCell.imageView, success: { () -> Void in
            
            // println("Success")
            
        }, failure: { () -> Void in
            
            // println("Failure.")
            
        }, cancel: { () -> Void in
            
            // println("Cancel.")
            
        })
        
        //ImageFetcher(imageURLString: post.imageURLString, imageView: parallaxCell.imageView)
        
        post.image = parallaxCell.imageView.image
        return parallaxCell
    }
    
    func playVideo(cell: ParallaxCollectionViewCell) {
        let player = AVPlayer(URL: NSURL(string: "http://www.hapticguides.com/wp-content/uploads/2015/06/Transformers-Revenge-Of-The-Fallen-Audi-R8.mp4")!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        cell.addSubview(playerController.view)
        playerController.view.frame = cell.frame
        player.play()
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if let visibleCells = collectionView!.visibleCells() as? [ParallaxCollectionViewCell] {
            for parallaxCell in visibleCells {
                let yOffset = ((collectionView!.contentOffset.y - parallaxCell.frame.origin.y) / ImageHeight) * OffsetSpeed
                parallaxCell.offset(CGPointMake(0.0, yOffset))
            }
        }
    }
}

