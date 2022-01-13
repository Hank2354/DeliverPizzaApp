//
//  MenuDataModel.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation

// MARK: - MenuDataModelElement
struct MenuDataModelElement: Codable {
    
    let category: String
    let desc:     String
    let imageURL: String
    let name:     String
    let minPrice: Int
    let id:       Int
    
}

typealias MenuDataModel = [MenuDataModelElement]
