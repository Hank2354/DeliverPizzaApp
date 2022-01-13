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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell
        
        guard let cell = cell else { return UITableViewCell() }
        
        cell.productImageView.image = .discountFreePizza
        cell.productTitle.text = "Баварские колбаски"
        cell.productDescription.text = "Баварские колбаски, ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус "
        
        cell.config()
        
        return cell
    }
    
    
}
