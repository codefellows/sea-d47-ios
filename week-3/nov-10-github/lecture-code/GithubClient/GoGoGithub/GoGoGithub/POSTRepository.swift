//
//  POSTRepository.swift
//  GoGoGithub
//
//  Created by Michael Babiy on 10/22/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class POSTRepository: APIRequest {
    
    var name: String
    
    init(name: String) {
        self.name = name
        
        super.init()
        self.httpMethod = .POST
    }

    override func url() -> String {
        return "https://api.github.com/user/repos"
    }
    
    override func queryStringParameters() -> [String : String]? {
        
        do {
            
            let accessToken = try MBGithubOAuth.shared.accessToken()
            return ["access_token" : accessToken]
            
        } catch _ {}
        
        return nil
    }
    
    override func httpBody() -> NSData? {
        
        do {
            return try NSJSONSerialization.dataWithJSONObject(["name" : self.name], options: NSJSONWritingOptions.PrettyPrinted)
        } catch _ {}
        
        return nil
    }
    
}
