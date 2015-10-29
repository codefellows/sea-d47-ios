//: Playground - noun: a place where people can play

import UIKit

/*

    Even though we assigned a value to the variable, it wont be 
    instantiated until it is needed / called.

*/

class Car {
    
    lazy var make = "Audi"
    
    func description() -> String {
        return self.make
    }
    
}

let car = Car()
// car.description()
