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
    
    // MARK: - UI Elements
    lazy var mainScrollView:    UIScrollView            = {
        
        let view = UIScrollView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled                           = false
        view.alwaysBounceVertical                      = true
        
        return view
    }()
    
    lazy var headerView:        HeaderView              = {
        
        let view = HeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.delegate                                  = self
        
        return view
        
    }()
    
    lazy var footerTableView:   FooterTableView         = {
        
        let tableView = FooterTableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.rowHeight           = UIScreen.main.bounds.height * 0.22
        tableView.backgroundColor     = .backgroundApplicationColor
        
        tableView.delegate            = self
        tableView.dataSource          = self
        
        tableView.isScrollEnabled     = true
        
        tableView.layer.cornerRadius  = 32
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
    func setupConstraints()      {
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(mainScrollView    .topAnchor.constraint      (equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(mainScrollView    .leadingAnchor.constraint  (equalTo: view.leadingAnchor))
        constraints.append(mainScrollView    .trailingAnchor.constraint (equalTo: view.trailingAnchor))
        constraints.append(mainScrollView    .bottomAnchor.constraint   (equalTo: view.bottomAnchor))
        
        constraints.append(headerView        .topAnchor.constraint      (equalTo: mainScrollView.topAnchor))
        constraints.append(headerView        .leadingAnchor.constraint  (equalTo: mainScrollView.leadingAnchor))
        constraints.append(headerView        .trailingAnchor.constraint (equalTo: mainScrollView.trailingAnchor))
        constraints.append(headerView        .heightAnchor.constraint   (equalToConstant: UIScreen.main.bounds.height * 0.3))
        
        constraints.append(footerTableView   .topAnchor.constraint      (equalTo: headerView.bottomAnchor))
        constraints.append(footerTableView   .leadingAnchor.constraint  (equalTo: mainScrollView.leadingAnchor))
        constraints.append(footerTableView   .trailingAnchor.constraint (equalTo: mainScrollView.trailingAnchor))
        constraints.append(footerTableView   .widthAnchor.constraint    (equalToConstant: UIScreen.main.bounds.width))
        constraints.append(footerTableView   .heightAnchor.constraint   (equalToConstant: UIScreen.main.bounds.height * 0.8))
        constraints.append(footerTableView   .bottomAnchor.constraint   (equalTo: mainScrollView.bottomAnchor))
        
        constraints.append(activityIndicator .centerXAnchor.constraint  (equalTo: mainScrollView.centerXAnchor))
        constraints.append(activityIndicator .centerYAnchor.constraint  (equalTo: mainScrollView.centerYAnchor))
        constraints.append(activityIndicator .widthAnchor.constraint    (equalToConstant: 50))
        constraints.append(activityIndicator .heightAnchor.constraint   (equalTo: activityIndicator.widthAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureNavBar()       {
        

        navigationController? .navigationBar          .setValue(true, forKey: "hidesShadow")
        navigationItem        .leftBarButtonItem?     .tintColor = .black
        navigationItem        .leftBarButtonItem      = UIBarButtonItem(title: "Москва ∨", style: .plain, target: nil, action: nil)
        
        
    }
    
    // MARK: - ViewController life cycle
    
    override func loadView()     {
        super.loadView()
        
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(headerView)
        mainScrollView.addSubview(footerTableView)
        mainScrollView.addSubview(activityIndicator)
        
        view.backgroundColor = .backgroundApplicationColor
        
        
    }
    
    override func viewDidLoad()  {
        super.viewDidLoad()

        setupConstraints()
        configureNavBar()
        
        presenter?.viewDidLoaded()

    }
}
