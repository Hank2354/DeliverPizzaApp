//
//  MenuAssembly.swift
//  DeliverPizzaApp
//
//  Created by Vladislav Mashkov on 12.01.2022.
//

import Foundation

class MenuAssembly: MenuAssemblyType {
    
    static func start() -> MenuRouterType {
        
        var router:      MenuRouterType          =  MenuRouter()
        var view:        MenuViewControllerType  =  MenuViewController()
        var interactor:  MenuInteractorType      =  MenuInteractor()
        var presenter:   MenuPresenterType       =  MenuPresenter()
        
        presenter.view        =  view
        presenter.interactor  =  interactor
        presenter.router      =  router
        view.presenter        =  presenter
        interactor.presenter  =  presenter
        
        router.entryPoint     =  view as? MenuEntryPoint
        
        return router
        
    }
    
}
