//
//  ViewController.swift
//  TabBarWithNavigation
//
//  Created by Roxane Gud on 1/30/20.
//  Copyright © 2020 Roxane Markhyvka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

final class FirstTabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    @IBAction private func pushButtonDidTap() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: FirstTabViewController.self))
        let vc = storyboard.instantiateViewController(identifier: "FirstTabSecondViewController")
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

final class SecondTabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
}

final class FirstTabSecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}

final class SecondTabSecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
    }
}

final class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
}

