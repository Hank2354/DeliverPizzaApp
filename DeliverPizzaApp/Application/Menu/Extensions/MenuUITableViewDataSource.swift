//
//  MenuUITableViewDataSource.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import Foundation
import UIKit

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let tableView = tableView as? FooterTableView else { return 0 }
        
        return tableView.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let tableView = tableView as? FooterTableView else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell
        
        guard let cell = cell else { return UITableViewCell() }
        
        cell.productTitle.text        = tableView.items[indexPath.row].positionName
        cell.productDescription.text  = tableView.items[indexPath.row].positionDescription
        cell.category                 = tableView.items[indexPath.row].category
        
        if let imageURL = tableView.items[indexPath.row].imageURL {
            
            cell.imageURLString = imageURL
            
        } else {
            
            cell.imageData      = tableView.items[indexPath.row].imageData
            
        }
        
        cell.priceButton.setTitle("от \(tableView.items[indexPath.row].minPrice) р", for: .normal)
        
        cell.config()
        
        return cell
    }
    
    
}
