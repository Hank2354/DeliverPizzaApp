//
//  MainTabBar.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation
import UIKit

class MainTabBar: UITabBarController {
    
    fileprivate func initMenuModule(tabBarString: String) -> UIViewController {
        
        let vc = UIViewController()
        
        let customTabBarItem: UITabBarItem = UITabBarItem(title: tabBarString,
                                                          image: .tabLogoMenu,
                                                          selectedImage: .tabLogoMenu?
                                                            .withRenderingMode(.alwaysOriginal)
                                                            .withTintColor(.tabBarItemSelectedColor))
        
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor.tabBarItemDefaultColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor.tabBarItemSelectedColor], for: .normal)
        
        
        vc.view.backgroundColor = .systemGreen
        
        vc.tabBarItem = customTabBarItem
        
        return vc
        
    }
    
    fileprivate func initEmptyModule(tabBarString: String) -> UIViewController {
        
        // Create empty VC
        let emptyVC = EmptyViewController()
        emptyVC.tabBarItem.title = tabBarString
        
        // Set custom tabBarItem
        let customTabBarItem: UITabBarItem = UITabBarItem(title: tabBarString,
                                                          image: nil,
                                                          selectedImage: nil)
        
        switch tabBarString {
            
        case "Контакты":
            
            customTabBarItem.image = .tabLogoContacts
            
            customTabBarItem.selectedImage = .tabLogoContacts?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.tabBarItemSelectedColor)
            
        case "Профиль" :
            
            customTabBarItem.image = .tabLogoProfile
            
            customTabBarItem.selectedImage = .tabLogoProfile?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.tabBarItemSelectedColor)
            
        case "Корзина" :
            
            customTabBarItem.image = .tabLogoBasket
            
            customTabBarItem.selectedImage = .tabLogoBasket?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.tabBarItemSelectedColor)
            
        default: break
            
        }
        
        emptyVC.tabBarItem = customTabBarItem
        
        return emptyVC
    }
    
    // Configure tabBar
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        tabBar.isTranslucent = false
        UITabBar.appearance().backgroundColor = .white
        
        // set VCs
        viewControllers = [
            initMenuModule(tabBarString: "Меню"),
            initEmptyModule(tabBarString: "Контакты"),
            initEmptyModule(tabBarString: "Профиль"),
            initEmptyModule(tabBarString: "Корзина"),
        ]
        
    }
    
}
