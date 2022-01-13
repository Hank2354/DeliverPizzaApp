//
//  MenuViewController.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, MenuViewControllerType {
    
    // MARK: - Properties
    var presenter: MenuPresenterType?
    
    var currentHeaderConstraint: NSLayoutConstraint?
    
    // MARK: - UI Elements
    lazy var headerView: HeaderView = {
        
        let view = HeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.delegate = self
        
        return view
        
    }()
    
    lazy var footerTableView: FooterTableView = {
        
        let tableView = FooterTableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UIScreen.main.bounds.height * 0.22
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: "productCell")
        
        return tableView
    }()
    
    // MARK: - ViewController life cycle
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .backgroundApplicationColor
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Oleg"
        
        view.addSubview(headerView)
        view.addSubview(footerTableView)
       
        headerView.backgroundColor = .yellow

        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        currentHeaderConstraint = headerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3)
        currentHeaderConstraint?.isActive = true
        
        footerTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        footerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        footerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        footerTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        headerView.discounts = [

            DiscountItemModel(image: .discountSale30),
            DiscountItemModel(image: .discountBirthday),
            DiscountItemModel(image: .discountFreePizza)


        ]

        headerView.categories = [

            "Пицца",
            "Комбо",
            "Десерты",
            "Напитки",
            "Снэки",
            "Для детей"

        ]
    }
}
