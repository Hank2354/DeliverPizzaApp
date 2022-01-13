//
//  MenuPresenter.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation

class MenuPresenter: MenuPresenterType {
    
    weak var view: MenuViewControllerType?
    
    var interactor: MenuInteractorType?
    
    var router: MenuRouterType?
    
    func discountDataIsFetched(discounts: DiscountItemModels) {
        
    }
    
    func menuDataIsFetched(tableItems: [ProductModel]?, categoryItems: [String]?, error: NetworkError?) {
        
    }
    
    
}
