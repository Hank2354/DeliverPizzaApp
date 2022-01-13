//
//  HeaderUICollectionViewDelegateFlowLayout.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation
import UIKit

extension HeaderView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
            
        case 1: return CGSize(width: discountItemWidth, height: discountItemHeight)
            
        case 2: return CGSize(width: 85, height: 35)
            
        default: return CGSize()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch collectionView.tag {
            
        case 1: return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            
        case 2: return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            
        default: return UIEdgeInsets()
            
        }
        
    }
}
