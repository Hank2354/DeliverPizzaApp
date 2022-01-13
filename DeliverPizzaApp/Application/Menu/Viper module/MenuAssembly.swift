//
//  MenuAssembly.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation

class MenuAssembly: MenuAssemblyType {
    
    static func start() -> MenuRouterType {
        
        let router:      MenuRouterType          =  MenuRouter()
        let view:        MenuViewControllerType  =  MenuViewController()
        let interactor:  MenuInteractorType      =  MenuInteractor()
        let presenter:   MenuPresenterType       =  MenuPresenter()
        
        presenter.view        =  view
        presenter.interactor  =  interactor
        presenter.router      =  router
        view.presenter        =  presenter
        interactor.presenter  =  presenter
        
        router.entryPoint     =  view as? MenuEntryPoint
        
        return router
        
    }
    
}
