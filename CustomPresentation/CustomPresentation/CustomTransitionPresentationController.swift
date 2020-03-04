//
//  CustomTransitionPresentationController.swift
//  CustomPresentation
//
//  Created by Roxane Gud on 2/03/20.
//  Copyright © 2020 Roxane Markhyvka. All rights reserved.
//

import UIKit

final class CustomPresentationController: UIPresentationController {
    private let animationDirection: CustomPresentationTransitionDirection
    
    private let presentedViewSize = CGSize(width: 200, height: 400)
    
    override var shouldRemovePresentersView: Bool {
        return true
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        return finalRect(for: animationDirection,
                         containerSize: presentingViewController.view.frame.size,
                         viewSize: presentedViewSize)
    }
    
    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, direction: CustomPresentationTransitionDirection) {
        animationDirection = direction
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
}

private extension CustomPresentationController {
    func finalRect(for direction: CustomPresentationTransitionDirection, containerSize: CGSize, viewSize: CGSize) -> CGRect {
        
        let originX = (containerSize.width - viewSize.width) / 2
        let originY = (containerSize.height - viewSize.height) / 2
        
        var calculatedOrigin = CGPoint.zero
        
        switch direction {

        case .topToBottom:
            calculatedOrigin = CGPoint(x: originX, y: containerSize.height - viewSize.height)
        case .bottomToTop:
            calculatedOrigin = CGPoint(x: originX, y: 0)
        case .leftToRight:
            calculatedOrigin = CGPoint(x: 0, y: originY)
        case .rightToLeft:
            calculatedOrigin = CGPoint(x: containerSize.width - viewSize.width, y:originY)
        }
        
        return CGRect(origin: calculatedOrigin, size: viewSize)
    }
}
