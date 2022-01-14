//
//  MenuPresenter.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation
import UIKit

class MenuPresenter: MenuPresenterType {
    
    weak var view:       MenuViewControllerType?
    
    var      interactor: MenuInteractorType?
    
    var      router:     MenuRouterType?
    
    func discountDataIsFetched (discounts: DiscountItemModels) {
        
        DispatchQueue.main.async { [unowned self] in
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
            
            DispatchQueue.main.async { [unowned self] in
                
                switch error! {
                    
                case .serverNotResponding:
                    createAlertMessage(with: "Сервер не отвечает")
                case .noInternetConnection:
                    createAlertMessage(with: "Нет сети")
                }
                
            }
            
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
        
        view?.footerTableView.fastScroll = true
        
        view?.footerTableView.scrollToRow(at:       IndexPath(row: currentPositionIndex, section: 0),
                                          at:       .top,
                                          animated: true)
        
        
        
    }
    
    func didScrollToNewCategory(category: String) {
        
        view?.headerView.selectNewCategory(categoryName: category)
        
    }
    
    func viewDidLoaded()                                      {
        
        self.interactor?.fetchDataFromServer()
       
    }
    
    fileprivate func createAlertMessage(with message: String) {
        
        let alertController = UIAlertController(title: "Ошибка сети", message: message, preferredStyle: .alert)
        
        let againButton = UIAlertAction(title: "Еще раз", style: .default) { [unowned self] _ in
            
            self.interactor?.fetchDataFromServer()
            
        }
        
        let lastDataAction = UIAlertAction(title: "Покажите, что осталось", style: .default, handler: nil)
        
        alertController.addAction(againButton)
        alertController.addAction(lastDataAction)
        
        view?.presentAlertMessage(ac: alertController)
        
    }
    
}
