//
//  FooterTableView.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 13.01.2022.
//

import UIKit

class FooterTableView: UITableView {

    var items = [ProductModel]() {
        didSet {
            self.reloadData()
        }
    }

}
