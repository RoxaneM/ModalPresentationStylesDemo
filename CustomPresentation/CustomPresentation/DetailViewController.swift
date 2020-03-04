//
//  DetailViewController.swift
//  CustomPresentation
//
//  Created by Roxane Gud on 2/02/20.
//  Copyright © 2020 Roxane Markhyvka. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
    
    
    @IBAction private func closeDetailButtonDidTap() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - storyboard init
extension DetailViewController {
    static func storyboardInstance() -> DetailViewController {
        let bundle = Bundle(for: DetailViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)

        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        return vc
    }
}
