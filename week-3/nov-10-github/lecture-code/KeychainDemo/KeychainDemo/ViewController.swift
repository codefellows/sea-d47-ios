//
//  ViewController.swift
//  KeychainDemo
//
//  Created by Adam Wallraff on 11/9/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

import UIKit
import Security

class ViewController: UIViewController {
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    

    
    let myToken = KeychainService.loadFromKeychain()
    print(myToken)
  
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  


}

