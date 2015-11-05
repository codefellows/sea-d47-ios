//
//  ViewController.swift
//  NewProject
//
//  Created by Michael Babiy on 11/4/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

let kDefaultAnimatioinDuration = 1.0

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var datasource = [Tweet]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateData()
        
        
//        let collectionViewWidth = CGRectGetWidth(self.view.frame)
//        let width = (collectionViewWidth / 3.0)
//        
//        print(width)
//        
//        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        
//        layout.itemSize = CGSizeMake(width, width)
//        layout.minimumLineSpacing = 0.0
//        layout.minimumInteritemSpacing = 0.0
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func generateData() {
        for _ in 1...100 {
            let image = UIImage(named: "audi-s3")!
            let tweet = Tweet(text: "Audi", image: image)
            self.datasource.append(tweet)
        }
        
        self.collectionView.reloadData()
        
    }
    
    // MARK: UICollectionView
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(TweetCollectionViewCell.identifier(), forIndexPath: indexPath) as! TweetCollectionViewCell
        
        
        let tweet = self.datasource[indexPath.row]
        cell.tweet = tweet
        
        return cell
        
    }

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(100.0, 100.0)
        
    }
}

