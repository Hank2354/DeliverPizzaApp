//
//  Product+CoreDataProperties.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 14.01.2022.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var minPrice: NSDecimalNumber?
    @NSManaged public var category: String?
    @NSManaged public var image: Data?

}

extension Product : Identifiable {

}
