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
        
        tableView.layer.cornerRadius = 32
        tableView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: "productCell")
        
        return tableView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        indicator.startAnimating()
        
        return indicator
    }()
    
    // MARK: - Configuration methods
    func setupConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        currentHeaderConstraint = headerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3)
        currentHeaderConstraint?.isActive = true
        
        constraints.append(footerTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor))
        constraints.append(footerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(footerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(footerTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        constraints.append(activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(activityIndicator.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(activityIndicator.heightAnchor.constraint(equalTo: activityIndicator.widthAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Москва ∨", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    // MARK: - ViewController life cycle
    
    override func loadView()     {
        super.loadView()
        
        view.addSubview(headerView)
        view.addSubview(footerTableView)
        view.addSubview(activityIndicator)
        
        view.backgroundColor = .backgroundApplicationColor
        
        
    }
    
    override func viewDidLoad()  {
        super.viewDidLoad()

        setupConstraints()
        configureNavBar()
        
        presenter?.viewDidLoaded()
    }
}
