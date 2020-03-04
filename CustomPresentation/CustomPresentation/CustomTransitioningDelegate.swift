//
//  CustomPresentationController.swift
//  CustomPresentation
//
//  Created by Roxane Gud on 2/13/20.
//  Copyright © 2020 Roxane Markhyvka. All rights reserved.
//

import UIKit

enum CustomPresentationTransitionDirection {
    case topToBottom
    case bottomToTop
    case leftToRight
    case rightToLeft
}

final class CustomTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    // rox: a singleton for now to force hold a reference to an instance,
    // since `transitioningDelegate` is a weak property and thus gets released after local stack of `presentCustomDirection` is cleaned
    // possible soolution: make transitions a specialty of a custom NavigationController, which will hold a reference to delegate object.
    static let shared = CustomTransitioningDelegate()

    var direction = CustomPresentationTransitionDirection.rightToLeft
    var animationDuration = 0.35 //default animation duration for transitions

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentAnimationController(direction: direction, duration: animationDuration)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomDismissAnimationController(direction: direction, duration: animationDuration)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        return CustomPresentationController(presentedViewController: presented, presenting: presenting, direction: direction)
    }
}

