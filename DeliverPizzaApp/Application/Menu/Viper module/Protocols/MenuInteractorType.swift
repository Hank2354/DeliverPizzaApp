//
//  MenuInteractorType.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation

protocol MenuInteractorType: AnyObject {
    
    var presenter: MenuPresenterType? { get set }
    
    func fetchDataFromServer()
    
    func fetchDiscountsFromServer()
    
    func fetchDataFromLocalDatabase()
    
}
