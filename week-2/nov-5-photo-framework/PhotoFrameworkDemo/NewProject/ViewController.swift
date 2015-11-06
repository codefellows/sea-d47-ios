//
//  ViewController.swift
//  NewProject
//
//  Created by Michael Babiy on 11/4/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

let kDefaultAnimatioinDuration = 1.0

import UIKit
import Photos
import Social

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var datasource = [Tweet]()
    var photosFetchResult:PHFetchResult?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosFetchResult =  PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: nil)
        self.generateData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func composeTweet(img: UIImage){
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let slcomposer = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            slcomposer.setInitialText("hello world")
            let ogWidth = img.size.width
            let ogHeight = img.size.height
            let width = CGFloat(200)
            let scaler =  width / ogWidth
            let height = ogHeight * scaler
            print("owidth:\(ogWidth), oheight: \(ogHeight)" )
            print("width:\(width) heigh:\(height) diff: \(scaler)")
            
            let postImage = ImageResizer.resizeImage(img, size: CGSize(width: width, height: height) )
            slcomposer.addImage(postImage )
            
            self.presentViewController(slcomposer, animated: true, completion: nil)
        }
    }
    
    func generateData() {
        print("begin genorate data")
        if let fetch = self.photosFetchResult {
            for (var i=0; i<fetch.count; i++)  {
                let tweet = Tweet(text: "Audi", image: nil)
                self.datasource.append(tweet)
            }
            self.collectionView.reloadData()
        }
    }
    
    // MARK: UICollectionView
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let fetch = photosFetchResult {
            print("hurrray we found \(fetch.count)")
            return self.datasource.count
        } else {
            print("boohoo")
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(TweetCollectionViewCell.identifier(), forIndexPath: indexPath) as! TweetCollectionViewCell
        
        
        if let fetch = self.photosFetchResult {
            if let asset = fetch[indexPath.row] as? PHAsset {
                PHCachingImageManager.defaultManager().requestImageForAsset(asset, targetSize: CGSize(width: 100, height: 100), contentMode: PHImageContentMode.AspectFill, options: nil, resultHandler: { (image, info) -> Void in
                    if let image = image {
                        
                        self.datasource[indexPath.row].image = image
                    }
                })
            }
        }
        
        
   
        let tweet = self.datasource[indexPath.row]
        cell.tweet = tweet
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(100.0, 100.0)
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if let fetch = self.photosFetchResult{
            if let asset = fetch[indexPath.row] as? PHAsset {
                PHCachingImageManager.defaultManager().requestImageDataForAsset(asset, options: nil, resultHandler: { (data, info, orrient, infoo) -> Void in
                    let image = UIImage(data: data!)
                    self.composeTweet(image!)
                })
            }
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

