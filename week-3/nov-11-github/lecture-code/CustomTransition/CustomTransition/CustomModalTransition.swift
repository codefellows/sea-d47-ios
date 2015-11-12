//
//  FiModalTransition.swift
//  Fi
//
//  Created by Michael Babiy on 6/6/15.
//  Copyright (c) 2015 Pixel Delirious. All rights reserved.
//

import UIKit

class CustomModalTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration = 1.0
    
    init(duratioin: NSTimeInterval) {
        self.duration = duratioin
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {return}
        guard let containerView = transitionContext.containerView() else {return}

        let finalFrame = transitionContext.finalFrameForViewController(toViewController)
        let screenBounds = UIScreen.mainScreen().bounds
        
        toViewController.view.frame = CGRectOffset(finalFrame, 0.0, screenBounds.size.height)
        containerView.addSubview(toViewController.view)
        
        UIView.animateWithDuration(self.duration, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            toViewController.view.frame = finalFrame
            }) { (finished) -> Void in
                transitionContext.completeTransition(true)
        }
    }
}
