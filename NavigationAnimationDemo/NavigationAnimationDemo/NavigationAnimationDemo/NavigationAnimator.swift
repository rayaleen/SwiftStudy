//
//  NavigationAnimator.swift
//  PullUpToClose
//
//  Created by chenbo on 3/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import UIKit

class NavigationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        transitionContext.containerView().insertSubview(toViewController!.view, belowSubview: fromViewController!.view)
        toViewController?.view.alpha = 1
        var rect = fromViewController!.view.frame
        rect.origin.y = CGRectGetMidY(rect)
        rect.size.height = 10
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            fromViewController?.view.frame = rect
        }) { (Bool completed) -> Void in
            transitionContext.containerView().bringSubviewToFront(toViewController!.view)
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1
    }
}
