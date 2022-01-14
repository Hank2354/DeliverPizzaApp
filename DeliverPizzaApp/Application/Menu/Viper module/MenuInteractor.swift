//
//  MenuInteractor.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation

class MenuInteractor: MenuInteractorType {
    
    weak var presenter:  MenuPresenterType?
    
    var networkManager  = NetworkManager  .shared
    var coreDataManager = CoreDataManager .shared
    
    func fetchDataFromServer()      {
        
        networkManager.fetchMenuData { [unowned self] result in
            
            switch result {
                
            case .success(let menuDataModel):
                
                // save current models and categories from network data
                var categories = [String]()
                var productModels = [ProductModel]()
                
                for dataModel in menuDataModel {
                    
                    categories    .append(dataModel.category)
                    
                    productModels .append(ProductModel(imageURL: dataModel.imageURL,
                                                     positionName: dataModel.name,
                                                     positionDescription: dataModel.desc,
                                                     minPrice: Decimal(integerLiteral: dataModel.minPrice),
                                                     category: dataModel.category))
                    
                }
                
                // Delete repeat elements in categories
                var categoriesWithoutRepeatingElements = Array(Set(categories))
                
                // Save main categories (must be getting always)
                let pizzaProducts  = productModels.filter { $0.category == "Пицца"   }
                let comboProducts  = productModels.filter { $0.category == "Комбо"   }
                let desertProducts = productModels.filter { $0.category == "Десерты" }
                let drinksProducts = productModels.filter { $0.category == "Напитки" }
                
                // Delete main categories from categories array
                categoriesWithoutRepeatingElements.removeAll { name in
                    name == "Пицца" || name == "Комбо" || name == "Десерты" || name == "Напитки"
                }
                
                // Save products with other categories
                var otherProducts = [[ProductModel]]()
                
                for category in categoriesWithoutRepeatingElements {
                    
                    var otherCategoryArray = [ProductModel]()
                    
                    for productModel in productModels {
                        
                        if productModel.category == category {
                            
                            otherCategoryArray.append(productModel)
                            
                        }
                        
                    }
                    
                    if !otherCategoryArray.isEmpty {
                        otherProducts.append(otherCategoryArray)
                    }
                    
                }
                
                // Create result array where pizza, combo, desert, drinks always first
                var resultProductArray: [ProductModel] = pizzaProducts + comboProducts + desertProducts + drinksProducts
                
                // create current catogories
                var currentCategories = [pizzaProducts .first! .category,
                                         comboProducts .first! .category,
                                         desertProducts.first! .category,
                                         drinksProducts.first! .category]
                
                // add other products in result array
                for productsArray in otherProducts {
                    resultProductArray += productsArray
                    currentCategories.append(productsArray.first!.category)
                    
                    
                }
                
                coreDataManager.saveNewDataFromServer(models: resultProductArray)
                
                self.presenter?.menuDataIsFetched(tableItems: resultProductArray, categoryItems: currentCategories, error: nil)
                
            case .failure(let error):
                
                presenter?.menuDataIsFetched(tableItems: nil, categoryItems: nil, error: error)
                
            }
            
        }
        
    }
    
    func fetchDiscountsFromServer() {
        
        networkManager.fetchDiscountData { [unowned self] discounts in
            
            presenter?.discountDataIsFetched(discounts: discounts)
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}
