//
//  ViewController.swift
//  GoGoGithub
//
//  Created by Michael Babiy on 10/21/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.update()
        
        GithubService.GETRepositories { (success, json) -> () in
            //
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func update() {
        
//        User.udpate { (success, user) -> () in
//            if let user = user {
//                print("Name: \(user.name)")
//                print("Date: \(user.createdAt)")
//            }
//        }
        
        Repository.update { (success, repositories) -> () in
            if let repositories = repositories {
                for repository in repositories {
                    print(repository.name)
                    print(repository.owner?.login)
                }
            }
        }
    }

}

