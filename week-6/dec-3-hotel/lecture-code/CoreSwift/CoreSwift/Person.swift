//
//  Person.swift
//  CoreSwift
//
//  Created by Michael Babiy on 12/3/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit
import CoreData


class Person: NSManagedObject {
    
    class func entityName() -> String {
        return NSStringFromClass(self)
    }
    
    class func personWith(name: String, age: NSNumber = 0) {
        guard let delegate = UIApplication.sharedApplication().delegate as? AppDelegate else {return}
        
        let context = delegate.managedObjectContext
        let person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: context) as! Person
        person.name = name
        person.age = age
        
        do {
            try context.save()
            print("Saved successfully.")
        } catch let error {
            print("Error saving. Error: \(error)")
        }
    }

}
