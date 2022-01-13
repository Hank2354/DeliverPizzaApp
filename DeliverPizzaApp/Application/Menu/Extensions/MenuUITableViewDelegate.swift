//
//  MenuUITableViewDelegate.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation
import UIKit

extension MenuViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentHeaderViewHeight = UIScreen.main.bounds.height * 0.3
        let minimumHeaderViewHeight = UIScreen.main.bounds.height * 0.07
        
        let allowableOffset = currentHeaderViewHeight - minimumHeaderViewHeight
        
        let offset = scrollView.contentOffset.y
        
        currentHeaderConstraint?.constant = currentHeaderViewHeight - (offset < allowableOffset ? offset : allowableOffset)

        
        
    }
}
