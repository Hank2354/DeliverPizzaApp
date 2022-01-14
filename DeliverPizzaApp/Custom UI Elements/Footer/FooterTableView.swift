//
//  FooterTableView.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import UIKit

class FooterTableView: UITableView {
    
    var shouldCalculateScrollDirection = false
    var lastContentOffset: CGFloat     = 0
    var scrollDirection: ScrollDirection = .up
    var fastScroll: Bool = false

    var items = [ProductModel]() {
        
        didSet {
            
            self.reloadData()
            
        }
        
    }

}
