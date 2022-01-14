//
//  DiscountCell.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation
import UIKit

class DiscountCell: UICollectionViewCell {
    
    // MARK: - Properties
    var mainImage: UIImage? {
        
        didSet {
            discountImageView.image = mainImage
        }
        
    }
    
    // MARK: - UI Elements
    lazy var discountImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return imageView
    }()
    
    // MARK: - Configuration methods
    func config()                             {
        
        addSubview(discountImageView)
        
        NSLayoutConstraint.activate([
            
            discountImageView .leadingAnchor.constraint  (equalTo: self.leadingAnchor),
            discountImageView .trailingAnchor.constraint (equalTo: self.trailingAnchor),
            discountImageView .topAnchor.constraint      (equalTo: self.topAnchor),
            discountImageView .bottomAnchor.constraint   (equalTo: self.bottomAnchor)
            
        ])
    }
    
    // MARK: - INIT
    override init(frame: CGRect)              {
        super .init(frame: frame)
        
        config()
    }
    
    required init?(coder: NSCoder)            {
        fatalError("init(coder:) has not been implemented")
    }
    
}
