//
//  CustomTransitionAnimation.swift
//  CustomPresentation
//
//  Created by Roxane Gud on 2/03/20.
//  Copyright © 2020 Roxane Markhyvka. All rights reserved.
//

import UIKit

// MARK: - Present animation
final class CustomPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDirection: CustomPresentationTransitionDirection
    private let animationDuration: Double

    init(direction: CustomPresentationTransitionDirection, duration: Double) {
        animationDirection = direction
        animationDuration = duration
    }

    // MARK: transitioning delegate
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to),
            let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }

        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toVC)
        let presentingRect = transitionContext.finalFrame(for: fromVC)

        let startingOrigin = hiddenPosition(for: animationDirection, visibleFrame: finalFrame, containerRect: presentingRect)
        toVC.view.frame = CGRect(origin: startingOrigin, size: finalFrame.size)
        containerView.addSubview(toVC.view)

        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
            toVC.view.frame = finalFrame
        }) { success in
            transitionContext.completeTransition(success)
        }
    }
}

// MARK: - Dismiss animation
final class CustomDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDirection: CustomPresentationTransitionDirection
    private let animationDuration: Double

    init(direction: CustomPresentationTransitionDirection, duration: Double) {
        animationDirection = direction
        animationDuration = duration
    }

    // MARK: transitioning delegate
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        // rox: if we presentationController specifies to remove presentingVC
        // we have to add the subview before starting the animation since it does not exist yet in view hierarchy
        // (thus black screen of containerView)
        let presentingViewWasRemoved = fromVC.presentationController?.shouldRemovePresentersView ?? false
        if presentingViewWasRemoved {
            let containerView = transitionContext.containerView
            containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        }
        
        let visibleFrame = transitionContext.finalFrame(for: fromVC)
        let presentingRect = transitionContext.finalFrame(for: toVC)

        let hiddenOrigin = hiddenPosition(for: animationDirection, visibleFrame: visibleFrame, containerRect: presentingRect)
        let finalFrame = CGRect(origin: hiddenOrigin, size: visibleFrame.size)
        let duration = transitionDuration(using: transitionContext)

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
            fromVC.view.frame = finalFrame
        }) { success in
            fromVC.view.removeFromSuperview()
            transitionContext.completeTransition(success)
        }
    }
}
fileprivate extension UIViewControllerAnimatedTransitioning {
    func hiddenPosition(for direction: CustomPresentationTransitionDirection, visibleFrame: CGRect, containerRect: CGRect) -> CGPoint {
        switch direction {

        case .topToBottom:
            return CGPoint(x: visibleFrame.origin.x, y: containerRect.minY - visibleFrame.height)
        case .bottomToTop:
            return CGPoint(x: visibleFrame.origin.x, y: containerRect.maxY + visibleFrame.height)
        case .leftToRight:
            return CGPoint(x: containerRect.minX - visibleFrame.width, y: visibleFrame.origin.y)
        case .rightToLeft:
            return CGPoint(x: containerRect.maxY + visibleFrame.width, y:visibleFrame.origin.y)
        }
    }
}
