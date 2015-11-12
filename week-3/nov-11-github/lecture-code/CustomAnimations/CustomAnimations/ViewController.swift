//
//  ViewController.swift
//  CustomAnimations
//
//  Created by Michael Babiy on 11/11/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centerX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func animateFrame() {
        
        let squareFrame = CGRect(x: 20.0, y: 20.0, width: 100.0, height: 100.0)
        let square = UIView(frame: squareFrame)
        square.layer.cornerRadius = 5.0
        square.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(square)
        
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            square.frame = CGRectOffset(squareFrame, 200.0, 200.0)
            }) { (success) -> Void in
                print("Completed...")
        }
    }
    
    func animateConstraint() {
        
        self.centerX.constant = -200.0
        
        UIView.animateWithDuration(0.4) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func animate(sender: AnyObject) {
        
        // self.animateConstraint()
        self.animateFrame()
        
    }

}

