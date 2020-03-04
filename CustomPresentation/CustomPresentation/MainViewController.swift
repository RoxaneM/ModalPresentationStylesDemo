//
//  MainViewController.swift
//  CustomPresentation
//
//  Created by Roxane Gud on 2/02/20.
//  Copyright © 2020 Roxane Markhyvka. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
    
    @IBAction private func showDetailButtonDidTap() {
        let presentedVC = DetailViewController.storyboardInstance()

        presentCustom(presentedVC, direction: .leftToRight)
    }

}

