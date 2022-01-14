//
//  ProductCell.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation
import UIKit

class ProductCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var dataTask: URLSessionDataTask?
    
    var category:         String  = ""
    
    var imageURLString:   String? {
        
        // When will set new image url, will be fetched image and set into imageView
        didSet {
            
            // Get data in not main queue (use utility qos)
            DispatchQueue.global(qos: .utility).async { [unowned self] in
                
                guard imageURLString    != "",
                      let imageURLString = self.imageURLString,
                      let imageURL       = URL(string: imageURLString) else {
                          
                          // if we can't get imageData, set default image
                          DispatchQueue.main.async {
                              
                              self.productImageView.image = UIImage.defaultPizza
                              self.activityIndicator.stopAnimating()
                              
                          }
                          
                          return
                          
                      }
                
                loadImage(imageURL: imageURL)
                
            }
            
            
        }
        
    }
    
    var imageData:        Data?   {
        
        didSet {
            
            guard let imageData = imageData,
                  let image = UIImage(data: imageData) else {
                
                      productImageView.image = .defaultPizza
                      return
                      
            }
            
            productImageView.image = image
            
        }
        
    }
    
    // MARK: - UI Elements
    lazy var productImageView:   UIImageView             = {
        
        let imageView = UIImageView()
        imageView       .translatesAutoresizingMaskIntoConstraints = false
        
        imageView       .image = .loadPizza
        
        imageView       .contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var productTitle:       UILabel                 = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font                      = UIFont.boldSystemFont(ofSize: 17)
        label.textColor                 = .label
        label.textAlignment             = .left
        
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor        = 0.5
        
        label.numberOfLines             = 2
        
        return label
    }()
    
    lazy var productDescription: UILabel                 = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font                      = UIFont.boldSystemFont(ofSize: 13)
        label.textColor                 = .placeholderText
        label.textAlignment             = .left
        
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor        = 0.8
        
        label.textAlignment             = .left
        label.numberOfLines             = 0
        
        label.sizeToFit()
        
        return label
    }()
    
    lazy var priceButton:        UIButton                = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.titleLabel?.font   = UIFont.systemFont(ofSize: 13)
        button.layer.borderColor  = UIColor.tabBarItemSelectedColor.cgColor
        
        button.layer.borderWidth  = 1
        button.layer.cornerRadius = 6
        
        button.setTitleColor (.tabBarItemSelectedColor, for: .normal)
        button.setTitle      ("от 345 р", for: .normal)
        
        return button
    }()
    
    lazy var activityIndicator:  UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        indicator.startAnimating()
        
        return indicator
    }()
    
    // MARK: - Configuration methods
    func config()                              {
        
        addSubview(productImageView)
        addSubview(productTitle)
        addSubview(productDescription)
        addSubview(priceButton)
        
        productImageView.addSubview(activityIndicator)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints .append(productImageView   .heightAnchor.constraint   (equalTo: productImageView.widthAnchor))
        constraints .append(productImageView   .leadingAnchor.constraint  (equalTo: leadingAnchor, constant: 15))
        constraints .append(productImageView   .topAnchor.constraint      (equalTo: topAnchor, constant: 15))
        constraints .append(productImageView   .bottomAnchor.constraint   (equalTo: bottomAnchor, constant: -15))
        constraints .append(productImageView   .trailingAnchor.constraint (equalTo: centerXAnchor, constant: -15))
        
        constraints .append(productTitle       .leadingAnchor.constraint  (equalTo: centerXAnchor, constant: 5))
        constraints .append(productTitle       .trailingAnchor.constraint (equalTo: trailingAnchor, constant: -5))
        constraints .append(productTitle       .topAnchor.constraint      (equalTo: topAnchor, constant: 20))
        
        constraints .append(priceButton        .bottomAnchor.constraint   (equalTo: bottomAnchor, constant: -20))
        constraints .append(priceButton        .trailingAnchor.constraint (equalTo: trailingAnchor, constant: -20))
        constraints .append(priceButton        .widthAnchor.constraint    (equalTo: widthAnchor, multiplier: 0.23))
        constraints .append(priceButton        .heightAnchor.constraint   (equalTo: heightAnchor, multiplier: 0.17))
        
        constraints .append(productDescription .leadingAnchor.constraint  (equalTo: productTitle.leadingAnchor))
        constraints .append(productDescription .trailingAnchor.constraint (equalTo: productTitle.trailingAnchor))
        constraints .append(productDescription .topAnchor.constraint      (equalTo: productTitle.bottomAnchor, constant: 5))
        constraints .append(productDescription .bottomAnchor.constraint   (lessThanOrEqualTo: priceButton.topAnchor, constant: -2))
        
        constraints .append(activityIndicator  .centerXAnchor.constraint  (equalTo: productImageView.centerXAnchor))
        constraints .append(activityIndicator  .bottomAnchor.constraint   (equalTo: productImageView.bottomAnchor, constant: -20))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    fileprivate func loadImage(imageURL: URL)  {
        
        // init data task
        dataTask = URLSession.shared.dataTask(with: imageURL, completionHandler: { data, response, error in
            
            // if image loaded success, update imageView in main thread
            if let data = data,
               let image = UIImage(data: data) {
                
                DispatchQueue.main.async { [unowned self] in
                    
                    self.productImageView.image = image
                    activityIndicator.stopAnimating()
                    
                }
                
            } else {
                
                DispatchQueue.main.async { [unowned self] in
                    
                    self.productImageView.image = .defaultPizza
                    activityIndicator.stopAnimating()
                    
                }
                
            }
            
        })
        
        dataTask?.resume()
        
    }
    
    override func prepareForReuse()            {
        super.prepareForReuse()
        
        dataTask?.cancel()
        
        productImageView.image = .loadPizza
        activityIndicator.startAnimating()
    }
}
