//
//  MenuInteractor.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation

class MenuInteractor: MenuInteractorType {
    
    weak var presenter: MenuPresenterType?
    
    // mock data
    var discounts = [
        
        DiscountItemModel(image: .discountSale30),
        DiscountItemModel(image: .discountBirthday),
        DiscountItemModel(image: .discountFreePizza)
        
        
    ]
    
    var categories = [
        
        "Пицца",
        "Комбо",
        "Десерты",
        "Напитки",
        "Снэки",
        "Для детей"
        
    ]
    
    
}
