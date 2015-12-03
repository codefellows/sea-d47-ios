//
//  Person+CoreDataProperties.swift
//  CoreSwift
//
//  Created by Michael Babiy on 12/3/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var age: NSNumber?

}
