//
//  ViewController.swift
//  Autolayout
//
//  Created by Michael Babiy on 10/16/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

/*
    Use this project to demosntrate how simple and awesome the layout is.
    Setup layout first:

    1. Width and Height on the squareView in storyboard.
    2. Center horizontally and vertically in storyboard.


    // Manually implementing Square centering.

    1. Remove all constraints from the cube.
    2. Disable autolayout in storyboards.
    3. Implment viewWillTransitionToSize:withTransitionCoordinator: function.
    4. Maybe add animation to when the centing should happen.
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cubeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        self.cubeView.center = self.view.center
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
//        
//        coordinator.animateAlongsideTransition({ (context) -> Void in
//            
//            //
//            
//            }) { (context) -> Void in
//                
//                self.cubeView.center.x = (CGRectGetWidth(self.view.frame) / 2.0)
//                self.cubeView.center.y = (CGRectGetHeight(self.view.frame) / 2.0)
//                
//        }
//    }

}

