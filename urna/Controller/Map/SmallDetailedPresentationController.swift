//
//  SmallDetailedPresentationController.swift
//  urna
//
//  Created by imac44 on 20.04.2022.
//

import UIKit

class SmallDetailedPresentationController: UIPresentationController {
    private let blurEffectView: UIView!
    //var heightOfFrame: CGFloat
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(dismissController))
        swipeGestureRecognizer.direction = .down
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView.isUserInteractionEnabled = true
        self.blurEffectView.addGestureRecognizer(tapGestureRecognizer)
        self.blurEffectView.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height * 0.7),
               size: CGSize(width: self.containerView!.frame.width,
                            height: self.containerView!.frame.height * 0.3))
    }
    
    override func presentationTransitionWillBegin() {
        self.blurEffectView.alpha = 0
        self.containerView?.addSubview(blurEffectView)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.alpha = 0.1
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in })
    }
    
    override func dismissalTransitionWillBegin() {
        self.blurEffectView.alpha = 0.1
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] (UIViewControllerTransitionCoordinatorContext) in
            self?.blurEffectView.alpha = 0.0
        }, completion: { [weak self] (UIViewControllerTransitionCoordinatorContext) in
            self?.blurEffectView.removeFromSuperview()
        })
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.layer.cornerRadius = 22.0
        
    }
    
    override func containerViewDidLayoutSubviews() {
          super.containerViewDidLayoutSubviews()
          presentedView?.frame = frameOfPresentedViewInContainerView
          blurEffectView.frame = containerView!.bounds
    }
    
    @objc func dismissController() {
          self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}
