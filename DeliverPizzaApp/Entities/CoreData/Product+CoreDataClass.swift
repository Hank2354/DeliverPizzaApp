//
//  Product+CoreDataClass.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 14.01.2022.
//
//

import Foundation
import CoreData

@objc(Product)
public class Product: NSManagedObject {
    
    convenience init() {
            self.init(entity: CoreDataManager.shared.entityForName(entityName: "Product"),
                      insertInto: CoreDataManager.shared.managedObjectContext)
        }
    
}
