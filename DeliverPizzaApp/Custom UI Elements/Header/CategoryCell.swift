//
//  CategoryCell.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
    
    // Properties
    var categoryTitle: String? {
        
        didSet {
            titleLabel.text = categoryTitle
        }
        
    }
    
    // UI Elements
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.tabBarItemSelectedColor.withAlphaComponent(0.4)
        
        
        return label
    }()
    
    func config() {
        
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.tabBarItemSelectedColor.withAlphaComponent(0.4).cgColor
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
        ])
    }
    
    override var isSelected: Bool {
        
        didSet {
            
            if isSelected {
                
                self.backgroundColor = UIColor.tabBarItemSelectedColor.withAlphaComponent(0.4)
                titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
                titleLabel.textColor = UIColor.tabBarItemSelectedColor
                self.layer.borderWidth = 0
                
            } else {
                
                self.backgroundColor = UIColor.clear
                titleLabel.font = UIFont.systemFont(ofSize: 13)
                titleLabel.textColor = UIColor.tabBarItemSelectedColor.withAlphaComponent(0.4)
                self.layer.borderWidth = 1
                
            }
            
        }
        
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
