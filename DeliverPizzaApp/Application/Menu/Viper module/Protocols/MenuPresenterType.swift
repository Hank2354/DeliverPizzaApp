//
//  MenuPresenterType.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation

protocol MenuPresenterType: AnyObject {
    
    var view:       MenuViewControllerType? { get set }
    
    var interactor: MenuInteractorType?     { get set }
    
    var router:     MenuRouterType?         { get set }
    
    func discountDataIsFetched  (discounts: DiscountItemModels)
    
    func menuDataIsFetched      (tableItems: [ProductModel]?,
                                 categoryItems: [String]?,
                                 error: NetworkError?)
    
    func categoryDidSelected    (category: String)
    
    func didScrollToNewCategory (category: String)
    
    func viewDidLoaded          ()
}
