//
//  DetailedPresentationController.swift
//  urna
//
//  Created by imac44 on 14.04.2022.
//

import UIKit

class DetailedPresentationController: UIPresentationController {
    
    let blurEffectView: UIVisualEffectView!
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        
        let blurEffect = UIBlurEffect(style: .dark)
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
        CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height * 0.2),
               size: CGSize(width: self.containerView!.frame.width,
                            height: self.containerView!.frame.height * 0.8))
    }
    
    override func presentationTransitionWillBegin() {
        self.blurEffectView.alpha = 0
        self.containerView?.addSubview(blurEffectView)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) in
            self.blurEffectView.alpha = 0.7
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in })
    }
    
    override func dismissalTransitionWillBegin() {
        self.blurEffectView.alpha = 0.7
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

//extension UIView {
//  func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
//      let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
//                              cornerRadii: CGSize(width: radius, height: radius))
//      let mask = CAShapeLayer()
//      mask.path = path.cgPath
//      layer.mask = mask
//  }
//}
