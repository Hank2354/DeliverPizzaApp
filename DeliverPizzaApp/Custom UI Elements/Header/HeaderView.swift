//
//  HeaderView.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    // Properties
    var discounts = [DiscountItemModel]()
    var categories = [String]()
    var delegate: CategoryCollectionViewDelegate?
    
    let discountItemWidth = UIScreen.main.bounds.width * 0.8
    let discountItemHeight = UIScreen.main.bounds.height / 6
    
    // UI Elements
    lazy var discountsCollectionView:   UICollectionView  =  {
        
        let layout = PagingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: discountItemWidth, height: discountItemHeight)
        layout.sectionInset = .init(top: 0,
                                    left: (UIScreen.main.bounds.width - discountItemWidth) / 2,
                                    bottom: 0,
                                    right: (UIScreen.main.bounds.width - discountItemWidth) / 2)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .backgroundApplicationColor
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.decelerationRate = .fast
        
        collectionView.register(DiscountCell.self, forCellWithReuseIdentifier: "discountCell")
        
        collectionView.tag = 1
        
        return collectionView
        
    }()
    
    lazy var categoriesCollectionView:  UICollectionView  =  {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .backgroundApplicationColor
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "categoryCell")
        
        collectionView.tag = 2
        
        return collectionView
        
    }()
    
    // Configuration methods
    func config() {
        
        addSubview(discountsCollectionView)
        addSubview(categoriesCollectionView)

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(categoriesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor))
        constraints.append(categoriesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor))
        constraints.append(categoriesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        constraints.append(categoriesCollectionView.heightAnchor.constraint(equalToConstant: 70))
        
        constraints.append(discountsCollectionView.topAnchor.constraint(equalTo: self.topAnchor))
        constraints.append(discountsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor))
        constraints.append(discountsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor))
        constraints.append(discountsCollectionView.bottomAnchor.constraint(equalTo: categoriesCollectionView.topAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    init(discounts: [DiscountItemModel], categories: [String]) {
        super.init(frame: .zero)
        
        self.discounts = discounts
        self.categories = categories
        
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
