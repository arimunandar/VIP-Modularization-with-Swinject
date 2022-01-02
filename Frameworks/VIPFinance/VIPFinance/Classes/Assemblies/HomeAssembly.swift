//
//  GeneralProducts.swift
//  VIPCore
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import Foundation
import Swinject
import VIPCore

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(IHomeManager.self) {(r) in
            return HomeManager()
        }.inObjectScope(.transient)
        
        container.register(IHomeWireframe.self) { (_, appRouter: IAppRouter) in
            HomeWireframe(appRouter: appRouter)
        }.inObjectScope(.transient)

        container.register(IHomeInteractor.self) { (r, view: IHomeViewController) in
            let presenter = r.resolve(IHomePresenter.self, argument: view)
            let manager = r.resolve(IHomeManager.self)
            let interactor = HomeInteractor(presenter: presenter, manager: manager)
            return interactor
        }.inObjectScope(.transient)

        container.register(IHomePresenter.self) { (_, view: IHomeViewController) in
            let presenter = HomePresenter(view: view)
            return presenter
        }.inObjectScope(.transient)

        container.register(HomeViewController.self) { (r, appRouter: IAppRouter) in
            let bundle = Bundle(for: type(of: self))
            let view = HomeViewController(nibName: "HomeViewController", bundle: bundle)
            let interactor = r.resolve(IHomeInteractor.self, argument: view as IHomeViewController)
            let wireframe = r.resolve(IHomeWireframe.self, argument: appRouter)
            view.interactor = interactor
            view.wireframe = wireframe
            return view
        }.inObjectScope(.transient)
    }
}
