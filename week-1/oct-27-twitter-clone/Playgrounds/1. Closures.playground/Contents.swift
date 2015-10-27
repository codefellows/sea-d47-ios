//: Playground - noun: a place where people can play

import UIKit

/*
    Declaration / base class.
*/

typealias CustomStringBoolClosure = (string: String, success: Bool) -> ()

class Car {
    
    class func status(closure: CustomStringBoolClosure) {
        
        NSOperationQueue().addOperationWithBlock { () -> Void in
            usleep(400000)
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                closure(string: "Audi is ready.", success: true)
            })
        }
    }
    
    class func numberOfCars() -> Int {
        return 100
    }
    
}


/*
    Usage. Lets pretend this is a dealer who is interested in:

    1. If Audi manufacturing is complete.
*/

Car.status { (string, success) -> () in
    if success {
        print(string)
    }
}

Car.numberOfCars()
