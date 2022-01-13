//
//  MenuRouterType.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation
import UIKit

typealias MenuEntryPoint = MenuViewControllerType & UIViewController

protocol MenuRouterType: AnyObject {
    
    var entryPoint: MenuEntryPoint? { get set }
    
}
