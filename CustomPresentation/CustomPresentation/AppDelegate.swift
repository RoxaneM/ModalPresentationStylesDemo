//
//  AppDelegate.swift
//  CustomPresentation
//
//  Created by Roxane Gud on 2/12/20.
//  Copyright © 2020 Roxane Markhyvka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? {
        didSet {
            window?.backgroundColor = .green
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

