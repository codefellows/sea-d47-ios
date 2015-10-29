//
//  ImageFetcher.swift
//  ImageFetcherApp
//
//  Created by Michael Babiy on 5/26/15.
//  Copyright (c) 2015 Michael Babiy. All rights reserved.
//

import UIKit

class ImageFetcher {
    
    // MARK: Variables

    static let sharedQueue = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT)
    static let sharedSession = NSURLSession(configuration:NSURLSessionConfiguration.defaultSessionConfiguration())
    
    let request: NSMutableURLRequest!
    let assetURL: NSURL!
    
    var sessionDataTask: NSURLSessionDataTask!
    var imageView: UIImageView!
    var isEnqueued = false
    
    var success: dispatch_block_t?
    var failure: dispatch_block_t?
    var cancel: dispatch_block_t?
    
    // MARK: Initializers
    
    init(imageURLString: String, imageView: UIImageView) {
        self.assetURL = NSURL(string: imageURLString)
        self.imageView = imageView
        self.request = NSMutableURLRequest(URL: self.assetURL)
        self.isEnqueued = true
        
        dispatch_async(ImageFetcher.sharedQueue, { [weak self] () -> Void in
            if let strongSelf = self {
                strongSelf.runRequest(strongSelf)
            }
        })
    }
    
    convenience init(imageURLString: String, imageView: UIImageView, success: dispatch_block_t, failure: dispatch_block_t, cancel: dispatch_block_t) {
        self.init(imageURLString: imageURLString, imageView: imageView)
        self.success = success
        self.failure = failure
        self.cancel = cancel
    }
    
    func cancelFetch() {
        self.sessionDataTask.suspend()
        self.sessionDataTask.cancel()
    }
    
    // MARK: Private Functions
    
    func runRequest(imageFetcher: ImageFetcher) {
        imageFetcher.sessionDataTask = ImageFetcher.sharedSession.dataTaskWithRequest(imageFetcher.request, completionHandler: { (data, response, error) -> Void in
            if error == nil && data!.bytes != nil { // If the length of the NSData object is 0, bytes returns nil.
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    imageFetcher.imageView.image = UIImage(data: data!)
                    if self.success != nil {
                        self.success!()
                    }
                })
            } else if (error != nil && self.failure != nil) {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.failure!()
                })
            }
        })
        
        imageFetcher.sessionDataTask.resume()
    }
}
