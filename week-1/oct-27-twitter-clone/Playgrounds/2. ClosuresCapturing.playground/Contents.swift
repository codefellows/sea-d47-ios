//: Playground - noun: a place where people can play

import UIKit

/*
    Declaration / base class.
*/

typealias CustomVoidClosure = () -> ()
typealias CustomStringBoolClosure = (string: String, success: Bool) -> ()

class Car {
    
    var customVoidClosure: CustomVoidClosure?
    var customStringBoolClosure: CustomStringBoolClosure?
    
    func status() {
        
        if let customVoidClosure = self.customVoidClosure {
            customVoidClosure()
        }
        
        if let customStringBoolClosure = self.customStringBoolClosure {
            customStringBoolClosure(string: "Audi is ready.", success: true)
        }
        
    }
    
}


/*
    Usage. Lets pretend this is a dealer who is interested in of 
    of two things: 

    1. If car manufacturing is complete. 
    2. If Audi manufacturing is complete.
*/

let car = Car()

car.customVoidClosure = ({
    print("Done.")
})

car.customStringBoolClosure = ({ string, success in
    if success {
        print(string)
    }
})

car.status()
