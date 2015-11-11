//
//  ViewController.swift
//  Keyframe
//
//  Created by Michael Babiy on 11/11/15.
//  Copyright © 2015 Michael Babiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var squareOne: UIView!
    @IBOutlet weak var squareTwo: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func animateKeyframe(sender: AnyObject) {
        
        let animationDuraton = 0.6
        
        UIView.animateKeyframesWithDuration(animationDuraton, delay: 0.0, options: .CalculationModeCubic, animations: { () -> Void in
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: { () -> Void in
                self.squareOne.center.x -= self.view.bounds.width
            })
            
            UIView.addKeyframeWithRelativeStartTime(animationDuraton / 2.0, relativeDuration: 0.5, animations: { () -> Void in
                self.squareTwo.center.x -= self.view.bounds.width
            })
            
            }) { (finished) -> Void in
                
                if finished {
                    
                    /*
                        Reset the frames to the right of the screen so
                        that it can be animated to center.
                    */
                    
                    self.squareOne.center.x += (self.view.bounds.width * 2.0)
                    self.squareTwo.center.x += (self.view.bounds.width * 2.0)
                    
                    UIView.animateKeyframesWithDuration(animationDuraton, delay: 0.0, options: .CalculationModeCubic, animations: { () -> Void in
                        UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5, animations: { () -> Void in
                            self.squareOne.center.x = self.view.center.x
                        })
                        
                        UIView.addKeyframeWithRelativeStartTime(animationDuraton / 2.0, relativeDuration: 0.5, animations: { () -> Void in
                            self.squareTwo.center.x = self.view.center.x
                        })
                        
                        }, completion: nil)
                }
        }
        
    }

}

