//
//  ProductCell.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation
import UIKit

class ProductCell: UITableViewCell {
    
    // MARK: - UI Elements
    lazy var productImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var productTitle: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .label
        label.textAlignment = .left
        
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var productDescription: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .placeholderText
        label.textAlignment = .left
        
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var priceButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(.tabBarItemSelectedColor, for: .normal)
        button.setTitle("от 345 р", for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.tabBarItemSelectedColor.cgColor
        
        return button
    }()
    
    func config() {
        
        addSubview(productImageView)
        addSubview(productTitle)
        addSubview(productDescription)
        addSubview(priceButton)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor))
        constraints.append(productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10))
        constraints.append(productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10))
        constraints.append(productImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10))
        constraints.append(productImageView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10))
        
        constraints.append(productTitle.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 5))
        constraints.append(productTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5))
        constraints.append(productTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20))
        
        constraints.append(priceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20))
        constraints.append(priceButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20))
        constraints.append(priceButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.23))
        constraints.append(priceButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.17))
        
        constraints.append(productDescription.leadingAnchor.constraint(equalTo: productTitle.leadingAnchor))
        constraints.append(productDescription.trailingAnchor.constraint(equalTo: productTitle.trailingAnchor))
        constraints.append(productDescription.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 10))
        constraints.append(productDescription.bottomAnchor.constraint(equalTo: priceButton.topAnchor, constant: -10))
        
        NSLayoutConstraint.activate(constraints)
    }
}
