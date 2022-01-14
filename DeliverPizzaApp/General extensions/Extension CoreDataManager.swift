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
                      
                      saveBackgroundContext()
                      
                      continue
                      
            }

            managetObjectProductModel .image = imageData
            
            saveBackgroundContext()

        }
        
    }
    
    
}
