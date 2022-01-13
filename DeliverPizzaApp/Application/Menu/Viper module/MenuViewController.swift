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
        
        let tableView = FooterTableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UIScreen.main.bounds.height * 0.22
        
        tableView.backgroundColor = .backgroundApplicationColor
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.bounces = true
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: "productCell")
        
        return tableView
    }()
    
    // MARK: - ViewController life cycle
    
    override func loadView()     {
        super.loadView()
        
        view.backgroundColor = .backgroundApplicationColor
        
        
    }
    
    override func viewDidLoad()  {
        super.viewDidLoad()

    }
}
