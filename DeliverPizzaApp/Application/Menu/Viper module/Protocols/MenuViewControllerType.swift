//
//  MenuViewControllerType.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation
import UIKit

protocol MenuViewControllerType: AnyObject {
    
    var presenter: MenuPresenterType? { get set }
    
    var headerView: HeaderView { get set }
    
    var footerTableView: FooterTableView { get set }
    
    var activityIndicator: UIActivityIndicatorView { get set }
}
