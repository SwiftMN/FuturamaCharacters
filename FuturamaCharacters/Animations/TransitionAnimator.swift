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
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // Make sure we have everything we need
        guard
            let mainVC: MainViewController = transitionContext.viewController(forKey: .from) as? MainViewController,
            let detailVC: DetailViewController = transitionContext.viewController(forKey: .to) as? DetailViewController,
            let detailView = detailVC.view,
            let mainView = mainVC.view,
            let nameLabel = mainVC.nameLabelCopy(),
            let nameLabelFrame = mainVC.nameLabelFrame(),
            let imageView = mainVC.imageViewCopy(),
            let imageViewFrame = mainVC.imageViewFrame()
        else {
            return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(mainView)
        containerView.addSubview(detailView)
        
        // create a view to represent the selected cell
        let cell = UIView(frame: .zero)
        cell.backgroundColor = .white
        cell.frame = cellFrame
        containerView.addSubview(cell)
        containerView.bringSubview(toFront: cell)
        
        // position title before animating
        nameLabel.frame = nameLabelFrame
        cell.addSubview(nameLabel)
        
        // position image before animating
        imageView.frame = imageViewFrame
        cell.addSubview(imageView)
        
        // make the actual detailView trasparent so we can still see the main view during the animation
        detailView.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            
            cell.frame = detailView.frame
            nameLabel.frame = detailVC.nameLabel.frame
            imageView.frame = detailVC.imageView.frame
            
        }, completion: { _ in
            
            detailView.alpha = 1
            
            cell.removeFromSuperview()
            nameLabel.removeFromSuperview()
            imageView.removeFromSuperview()
            
            transitionContext.completeTransition(true)
        })
    }
}
