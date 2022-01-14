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
            
//            print("ELEMENTS: \(result!.count)")
            if let result = result, !result.isEmpty {
                
                for element in result {
                    managetObjectBackgroundContext.delete(element as NSManagedObject)
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
    
    func loadDataFromLocalDatabase() -> [ProductModel]? {
        
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        
        var currentProductModels = [ProductModel]()
        
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            guard !results.isEmpty else { return nil }
            
            for result in results {
                
                guard let image    = result.image,
                      let name     = result.name,
                      let desc     = result.desc,
                      let minPrice = result.minPrice,
                      let category = result.category else {
                          
                          continue
                          
                      }
                
                currentProductModels.append(ProductModel(imageURL:             nil,
                                                         imageData:            image,
                                                         positionName:         name,
                                                         positionDescription:  desc,
                                                         minPrice:             minPrice as Decimal,
                                                         category:             category))
                
            }
            
            if !currentProductModels.isEmpty {
                return currentProductModels
            } else {
                return nil
            }
            
        } catch let error as NSError {
            
            print(error.localizedDescription)
            return nil
            
        }
        
    }
    
}
