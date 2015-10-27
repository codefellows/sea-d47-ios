//
//  ViewController.swift
//  NSOperationQueues
//
//  Created by Michael Babiy on 10/16/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var secretMessageLabel: UILabel!
    
    var processStarted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func processPrimes() {
        // self.processPrimesMainQ()
        self.processPrimesSeparateQ()
    }
    
    func processPrimesMainQ() {
        let startDate = NSDate()
        let numbers = 1...100000
        var primes = [Int]()
        
        for number in numbers {
            var prime = true
            for var i = 2; i <= number; i++ {
                if number % 2 == 0 {
                    prime = false
                    break
                }
            }
            
            if prime == true {
                primes.append(number)
            }
            
        }
        
        let endDate = NSDate().timeIntervalSinceDate(startDate)
        self.messageLabel.text = "Task complete... \(endDate)"
        
        // Important message...
        self.secretMessageLabel.text = "Meet me in 10 seconds..."
    }

    func processPrimesSeparateQ() {
        
        if !self.processStarted {
            
            self.processStarted = true
            
            let startDate = NSDate()
            let numbers = 1...100000
            var primes = [Int]()
            
            NSOperationQueue().addOperationWithBlock { () -> Void in
                
                for number in numbers {
                    var prime = true
                    for var i = 2; i <= number; i++ {
                        if number % 2 == 0 {
                            prime = false
                            break
                        }
                    }
                    
                    if prime == true {
                        primes.append(number)
                    }
                    
                }
                
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    let endDate = NSDate().timeIntervalSinceDate(startDate)
                    self.messageLabel.text = "Task complete... \(endDate)"
                    self.processStarted = false
                })
                
            }
            
            // Important message...
            self.secretMessageLabel.text = "Meet me in 10 seconds..."
        }
        
    }
    
}

