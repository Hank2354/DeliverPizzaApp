//
//  MenuCategoryCollectionViewDelegate.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation

extension MenuViewController: CategoryCollectionViewDelegate {
    
    func didSelectCategory(_ categoryName: String) {
        
        presenter?.categoryDidSelected(category: categoryName)
        
    }
    
}
