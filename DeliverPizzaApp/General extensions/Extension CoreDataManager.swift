//
//  Extension CoreDataManager.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 14.01.2022.
//

import Foundation
import UIKit
import CoreData

enum ContextType {
    case main
    case background
}

extension CoreDataManager {
    
    func saveNewDataFromServer(models: [ProductModel]) {
        
        persistentContainer.performBackgroundTask { managetObjectBackgroundContext in
            
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
            let result = try? managetObjectBackgroundContext.fetch(fetchRequest)
            
            print("111")
            if let result = result, !result.isEmpty {
                
                for element in result {
                    managetObjectBackgroundContext.delete(element)
                }
                
            }
            
            for model in models {

                let managetObjectProductModel = Product(contextType: .background)

                managetObjectProductModel .name     = model.positionName
                managetObjectProductModel .desc     = model.positionDescription
                managetObjectProductModel .category = model.category
                managetObjectProductModel .minPrice = model.minPrice as NSDecimalNumber

                let imageLink = URL(string: model.imageURL ?? "https://i.yapx.ru/QGcBE.png")

                guard let imageLink = imageLink,
                      let imageData = try? Data(contentsOf: imageLink) else {
                          
                          managetObjectProductModel .image = nil
                          
                          self.saveBackgroundContext()
                          
                          continue
                          
                }

                managetObjectProductModel .image = imageData

            }
            
            self.saveBackgroundContext()
            
            print("COMPLETE")
            
        }
        
        
        
    }
    
}
