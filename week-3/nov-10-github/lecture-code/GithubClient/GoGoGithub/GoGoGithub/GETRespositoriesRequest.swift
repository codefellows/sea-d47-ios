//
//  GETRespositories.swift
//  GoGoGithub
//
//  Created by Michael Babiy on 10/21/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class GETRespositoriesRequest: APIRequest {
    
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
    
}
