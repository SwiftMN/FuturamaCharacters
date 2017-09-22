//
//  TransitionAnimator.swift
//  FuturamaCharacters
//
//  Created by Steven Vlaminck on 9/12/17.
//  Copyright © 2017 Steven Vlaminck. All rights reserved.
//

import Foundation
import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    var cellFrame: CGRect = .zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func isPresenting(transitionContext: UIViewControllerContextTransitioning) -> Bool {
        return transitionContext.viewController(forKey: .from) is MainViewController
    }
    
    func viewController<T>(from transitionContext: UIViewControllerContextTransitioning) -> T? {
        if let fromVC = transitionContext.viewController(forKey: .from) as? T {
            return fromVC
        }
        if let toVC = transitionContext.viewController(forKey: .to) as? T {
            return toVC
        }
        return nil
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // Make sure we have everything we need
        guard
            let mainVC: MainViewController = viewController(from: transitionContext),
            let detailVC: DetailViewController = viewController(from: transitionContext),
            let detailView = detailVC.view,
            let mainView = mainVC.view,
            let nameLabel = mainVC.nameLabelCopy(),
            let nameLabelFrame = mainVC.nameLabelFrame(),
            let imageView = mainVC.imageViewCopy(),
            let imageViewFrame = mainVC.imageViewFrame()
            else {
                return
        }
        
        let presenting = isPresenting(transitionContext: transitionContext)
        let containerView = transitionContext.containerView
        containerView.addSubview(mainView)
        containerView.addSubview(detailView)
        
        // create a view to represent the selected cell
        let cell = UIView(frame: .zero)
        cell.backgroundColor = .white
        cell.frame = presenting ? cellFrame : detailView.frame
        containerView.addSubview(cell)
        containerView.bringSubview(toFront: cell)
        
        // position title before animating
        nameLabel.frame = presenting ? nameLabelFrame : detailVC.nameLabel.frame
        cell.addSubview(nameLabel)
        
        // position image before animating
        imageView.frame = presenting ? imageViewFrame : detailVC.imageView.frame
        cell.addSubview(imageView)
        
        // make the actual detailView trasparent so we can still see the main view during the animation
        detailView.alpha = 0
        
        // add a blur effect to the main view as we transition
        let effectView = UIVisualEffectView(frame: mainView.frame)
        effectView.effect = UIBlurEffect(style: UIBlurEffectStyle.prominent)
        effectView.alpha = presenting ? 0 : 1
        mainView.addSubview(effectView)
        
        // add the description label to be faded in and out
        let descriptionLabel = detailVC.descriptionLabel.createCopy()
        descriptionLabel.frame = detailVC.descriptionLabel.frame
        descriptionLabel.alpha = presenting ? 0 : 1
        cell.addSubview(descriptionLabel)
        
        // animate the cell, label, and image independently of the description label
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
            
            // animate between the cell and the detail view
            UIView.addKeyframe(withRelativeStartTime: presenting ? 0 : 0.25, relativeDuration: 0.75, animations: {
                effectView.alpha = presenting ? 1 : 0
                cell.frame = presenting ? detailView.frame : self.cellFrame
                nameLabel.frame = presenting ? detailVC.nameLabel.frame : nameLabelFrame
                imageView.frame = presenting ? detailVC.imageView.frame : imageViewFrame
                
            })
            
            // fade the description label in and out
            UIView.addKeyframe(withRelativeStartTime: presenting ? 0.75 : 0, relativeDuration: 0.25, animations: {
                descriptionLabel.alpha = presenting ? 1 : 0
            })
            
        }, completion: { _ in
            detailView.alpha = 1
            
            cell.removeFromSuperview()
            nameLabel.removeFromSuperview()
            imageView.removeFromSuperview()
            effectView.removeFromSuperview()
            
            transitionContext.completeTransition(true)
        })
    }
}
