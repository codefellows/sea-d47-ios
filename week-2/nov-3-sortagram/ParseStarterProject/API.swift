//
//  API.swift
//  ParseStarterProject-Swift
//
//  Created by Michael Babiy on 10/21/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

typealias ParseCompletionHandler = (success: Bool) -> ()

class API {
    
    class func uploadImage(image: UIImage, completion: ParseCompletionHandler) {
        
//        let smallImage = ImageResizer.resizeImage(image, size: CGSize(width: 500, height: 500))
        
        if let imageData = UIImageJPEGRepresentation(image, 0.7) {
            
            let imageFile = PFFile(name: "image", data: imageData)
            let status = PFObject(className: "Status")
            status["image"] = imageFile
            
            status.saveInBackgroundWithBlock({ (success, error) -> Void in
                if success {
                    completion(success: success)
                } else {
                    completion(success: false)
                }
            })
        }
        
    }
    
}