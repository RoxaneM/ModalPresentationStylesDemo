//
//  UIViewController+Transitions.swift
//  CustomPresentation
//
//  Created by Roxane Gud on 2/03/20.
//  Copyright © 2020 Roxane Markhyvka. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentCustom(_ vc: UIViewController,
                       direction: CustomPresentationTransitionDirection,
                       completion: (() -> Void)? = nil) {

        let transitioningDelegate = CustomTransitioningDelegate.shared
        transitioningDelegate.direction = direction
        transitioningDelegate.animationDuration = 0.4

        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = transitioningDelegate
        
        present(vc, animated: true) {
            completion?()
        }
    }


}
