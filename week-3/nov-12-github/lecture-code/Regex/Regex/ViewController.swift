//
//  ViewController.swift
//  Regex
//
//  Created by Michael Babiy on 11/12/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = "Hello World"
        let pattern = "[^0-9a-zA-Z]"
        
        do {
            
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
            let matchCount = regex.numberOfMatchesInString(string, options: [], range: NSRange(location: 0, length: string.characters.count))
            print(matchCount)
            
        } catch let error {
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

