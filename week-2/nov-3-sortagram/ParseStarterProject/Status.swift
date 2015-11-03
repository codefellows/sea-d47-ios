//
//  Status.swift
//  ParseStarterProject-Swift
//
//  Created by nacnud on 10/21/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import Foundation
import UIKit

class Status {
    var image:UIImage
    var thumbnail:UIImage?
    var status:String
    
    init(image:UIImage, status:String, thumbnail:UIImage?){
        self.image = image
        self.status = status
        self.thumbnail = thumbnail
    }
}