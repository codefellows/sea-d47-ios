//
//  ViewController.swift
//  Keyframe
//
//  Created by Michael Babiy on 11/11/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var squareTwo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.squareTwo.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func animateKeyframe(sender: AnyObject) {
        
        // Example of rotating view 45 degrees clockwise.
        
        for _ in 0...6 {
            UIView.animateWithDuration(0.4) { () -> Void in
                self.squareTwo.transform = CGAffineTransformRotate(self.squareTwo.transform, CGFloat(M_PI * 45 / 180.0))
                self.squareTwo.transform = CGAffineTransformScale(self.squareTwo.transform, 1.6, 1.6)
            }
        }
        
    }

}

