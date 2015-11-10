//
//  MBGithubOAuth.swift
//  MBGithubOAuth
//
//  Created by Michael Babiy on 10/20/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

let kAccessTokenKey = "kAccessTokenKey"
let kOAuthBaseURLString = "https://github.com/login/oauth/"
let kAccessTokenRegexPattern = "access_token=([^&]+)"

typealias MBGithubOAuthCompletion = (success: Bool) -> ()

enum MBGithubOAuthError: ErrorType {
    case MissingAccessToken(String)
    case ExtractingTokenFromString(String)
    case ExtractingTermporaryCode(String)
    case ResponseFromGithub(String)
}

enum SaveOptions: Int {
    case UserDefaults
}

class MBGithubOAuth {
    
    /*
        Setup your Github client id and your client secret first.
    */
    
    var githubClientId = ""
    var githubClientSecret = ""
    
    static let shared = MBGithubOAuth()

    func oauthRequestWith(parameters: [String : String]) {
        var parametersString = String()
        for parameter in parameters.values {
            parametersString = parametersString.stringByAppendingString(parameter)
        }
        
        // URL constructor.
        if let requestURL = NSURL(string: "\(kOAuthBaseURLString)authorize?client_id=\(self.githubClientId)&scope=\(parametersString)") {
            
            print(requestURL)
            
            UIApplication.sharedApplication().openURL(requestURL)
        }
    }
    
    func tokenRequestWithCallback(url: NSURL, options: SaveOptions, completion: MBGithubOAuthCompletion) {
        
        do {
            let temporaryCode = try self.temporaryCodeFromCallback(url)
            let requestString = "\(kOAuthBaseURLString)access_token?client_id=\(self.githubClientId)&client_secret=\(self.githubClientSecret)&code=\(temporaryCode)"
            
            
            if let requestURL = NSURL(string: requestString) {
                
                let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
                let session = NSURLSession(configuration: sessionConfiguration)
                session.dataTaskWithURL(requestURL, completionHandler: { (data, response, error) -> Void in
                    
                    if let _ = error {
                        completion(success: false); return
                    }
                    
                    if let data = data {
                        if let tokenString = self.stringWith(data) {
                            
                            do {
                                let token = try self.accessTokenFromString(tokenString)!
                                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                    completion(success: self.saveAccessTokenToUserDefaults(token))
                                })
                                
                            } catch _ {
                                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                    completion(success: false)
                                })
                            }
                        
                        }
                    }
                }).resume()
            }
            
        } catch _ {
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                completion(success: false)
            })
        }
    }
    
    func accessToken() throws -> String {
        
        guard let accessToken = NSUserDefaults.standardUserDefaults().stringForKey(kAccessTokenKey) else {
            throw MBGithubOAuthError.MissingAccessToken("You don't have access token saved.")
        }
        
        return accessToken
        
    }
    
    // MARK: Helper Functions
    
    func temporaryCodeFromCallback(url: NSURL) throws -> String {
        
        guard let temporaryCode = url.absoluteString.componentsSeparatedByString("=").last else {
            throw MBGithubOAuthError.ExtractingTermporaryCode("Error ExtractingTermporaryCode. See: temporaryCodeFromCallback:")
        }
        
        return temporaryCode
    }
    
    func accessTokenFromString(string: String) throws -> String? {
        
        do {
            let regex = try NSRegularExpression(pattern: kAccessTokenRegexPattern, options: NSRegularExpressionOptions.CaseInsensitive)
            let matches = regex.matchesInString(string, options: NSMatchingOptions.Anchored, range: NSMakeRange(0, string.characters.count))
            if matches.count > 0 {
                for (_, value) in matches.enumerate() {
                    let matchRange = value.rangeAtIndex(1)
                    return (string as NSString).substringWithRange(matchRange)
                }
            }
        } catch _ {
            throw MBGithubOAuthError.ExtractingTokenFromString("Could not extract token from string.")
        }
        
        return nil
    }
    
    func saveAccessTokenToUserDefaults(accessToken: String) -> Bool {
        NSUserDefaults.standardUserDefaults().setObject(accessToken, forKey: kAccessTokenKey)
        return NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func stringWith(data: NSData) -> String? {
        let byteBuffer: UnsafeBufferPointer<UInt8> = UnsafeBufferPointer<UInt8>(start: UnsafeMutablePointer<UInt8>(data.bytes), count: data.length)
        return String(bytes: byteBuffer, encoding: NSASCIIStringEncoding)
    }
    
}