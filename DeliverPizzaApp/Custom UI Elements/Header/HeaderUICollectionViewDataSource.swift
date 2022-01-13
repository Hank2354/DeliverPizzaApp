//
//  HeaderUICollectionViewDataSource.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation
import UIKit

extension HeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
            
        case 1: return discounts.count
            
        case 2: return categories.count
            
        default: return 0
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
            
        case 1:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discountCell", for: indexPath) as? DiscountCell
            
            guard let cell = cell else { return UICollectionViewCell() }
            
            cell.mainImage = discounts[indexPath.row].image
            
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            
            return cell
            
        case 2:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell
            
            guard let cell = cell else { return UICollectionViewCell() }
            
            cell.categoryTitle = categories[indexPath.row]
            
            return cell
            
        default: return UICollectionViewCell()
            
        }
        
    }
    
    
}
