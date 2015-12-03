//
//  ViewController.swift
//  CoreSwift
//
//  Created by Michael Babiy on 12/3/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func savePerson() {
        Person.personWith("Michael", age: 12.9)
    }
    
    func printPerson() {
        let request = NSFetchRequest(entityName: "Person")
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let result = try! context.executeFetchRequest(request)
        print((result.first as! Person).name)
    }


}

