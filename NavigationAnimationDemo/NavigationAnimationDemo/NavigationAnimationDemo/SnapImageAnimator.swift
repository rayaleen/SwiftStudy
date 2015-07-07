//
//  SnapImageAnimator.swift
//  NavigationAnimationDemo
//
//  Created by chenbo on 6/7/15.
//  Copyright (c) 2015 raychen. All rights reserved.
//

import UIKit

class SnapImageAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var operationType : UINavigationControllerOperation?
    var selectedImageView : UIView?
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        var snapShotImageView : UIImageView
        var snapImageViewController : SnapImageViewController!
        var homeViewController : HomeViewController!
        if self.operationType == .Push {
            homeViewController = fromViewController as! HomeViewController
            snapImageViewController = toViewController as! SnapImageViewController
            let frame = homeViewController.view.convertRect(self.selectedImageView!.frame, fromView: self.selectedImageView?.superview)
            self.selectedImageView = self.selectedImageView?.snapshotViewAfterScreenUpdates(false)
            self.selectedImageView?.frame = frame;
        }
        toViewController?.view.alpha = 0;
        containerView.addSubview(toViewController!.view)
        containerView.addSubview(self.selectedImageView!)
        toViewController!.view.layoutIfNeeded()
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            self.selectedImageView?.frame = snapImageViewController.imageView.frame
        }, completion: ({completed in
            toViewController?.view.alpha = 1
            self.selectedImageView?.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }))
    }
}
