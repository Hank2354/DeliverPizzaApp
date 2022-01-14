//
//  AppDelegate.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window                     = UIWindow()
        let mainTabBar             = MainTabBar()
        window?.rootViewController = mainTabBar
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }

}

