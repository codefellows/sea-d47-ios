//
//  APIRequest.swift
//  this.place
//
//  Created by Michael Babiy on 10/21/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

let kEmptyString = ""

enum MIMEType: String {
    case ApplicationXWWWFormUrlEncoded = "application/x-www-form-urlencoded"
    case ApplicationJSON = "application/json"
}

enum HTTPMethod: String {
    case POST = "POST"
    case GET = "GET"
    case DELETE = "DELETE"
    case PUT = "PUT"
}

class APIRequest {
    
    var httpMethod = HTTPMethod.GET
    var headerContentType = MIMEType.ApplicationJSON
    
    func url() -> String { return kEmptyString }
    func httpHeaders() -> [String : String]? { return nil }
    func httpBody() -> NSData? { return nil }
    func queryStringParameters() -> [String : String]? { return nil }
    
}