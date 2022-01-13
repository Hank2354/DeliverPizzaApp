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
    let desc: String
    let id: Int
    let imageURL: String
    let minPrice: Int
    let name: String
}

typealias MenuDataModel = [MenuDataModelElement]
