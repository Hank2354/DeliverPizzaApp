//
//  MenuViewControllerType.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation

protocol MenuViewControllerType: AnyObject {
    
    var presenter: MenuPresenterType? { get set }
}
