//
//  PostJSONParser.swift
//  TwitterCF
//
//  Created by Jeffrey Jacka on 8/3/15.
//  Copyright (c) 2015 Jeffrey Jacka. All rights reserved.
//

import Foundation

class PostJSONParser {
  class func postsFromJSONData(jsonData : NSData) -> [Post]? {
    var error : NSError?
    
    if let rootObject = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) {
      
    }
    
  }