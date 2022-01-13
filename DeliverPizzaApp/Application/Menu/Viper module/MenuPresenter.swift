//
//  MenuPresenter.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation

class MenuPresenter: MenuPresenterType {
    
    weak var view:       MenuViewControllerType?
    
    var      interactor: MenuInteractorType?
    
    var      router:     MenuRouterType?
    
    func discountDataIsFetched(discounts: DiscountItemModels) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            view?.headerView.discounts = discounts
        }
        
    }
    
    func menuDataIsFetched(tableItems: [ProductModel]?,
                           categoryItems: [String]?,
                           error: NetworkError?)              {
        
        
        guard let tableItems = tableItems,
              let categoryItems = categoryItems,
              error == nil
                
        else {
                  
                  return
                  
              }
        
        DispatchQueue.main.async { [unowned self] in
            
            self.view?.footerTableView.items = tableItems
            self.view?.headerView.categories = categoryItems
            
            self.view?.activityIndicator.stopAnimating()
            
            interactor?.fetchDiscountsFromServer()
        }
        
    }
    
    func categoryDidSelected(category: String)                {
        
        let currentPositionIndex = view?.footerTableView.items.firstIndex(where: {$0.category == category}) ?? 0
        
        view?.footerTableView.scrollToRow(at:       IndexPath(row: currentPositionIndex, section: 0),
                                          at:       .top,
                                          animated: true)
        
        
    }
    
    func viewDidLoaded()                                      {
        
        self.interactor?.fetchDataFromServer()
       
    }
    
}
