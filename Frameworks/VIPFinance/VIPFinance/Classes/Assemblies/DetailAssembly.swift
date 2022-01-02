//
//  DetailAssembly.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//

import Foundation
import Swinject
import VIPCore

class DetailAssembly: Assembly {
    func assemble(container: Container) {
        container.register(IDetailManager.self) { _ in
            DetailManager()
        }.inObjectScope(.transient)

        container.register(IDetailWireframe.self) { (_, appRouter: IAppRouter) in
            DetailWireframe(appRouter: appRouter)
        }.inObjectScope(.transient)

        container.register(IDetailInteractor.self) { (r, view: IDetailViewController) in
            let presenter = r.resolve(IDetailPresenter.self, argument: view)
            let manager = r.resolve(IDetailManager.self)
            let interactor = DetailInteractor(presenter: presenter, manager: manager)
            return interactor
        }.inObjectScope(.transient)

        container.register(IDetailPresenter.self) { (_, view: IDetailViewController) in
            let presenter = DetailPresenter(view: view)
            return presenter
        }.inObjectScope(.transient)

        container.register(DetailViewController.self) { (r, appRouter: IAppRouter, parameters: DetailModuleParameter?) in
            let bundle = Bundle(for: type(of: self))
            let view = DetailViewController(nibName: "DetailViewController", bundle: bundle)
            let interactor = r.resolve(IDetailInteractor.self, argument: view as IDetailViewController)
            let wireframe = r.resolve(IDetailWireframe.self, argument: appRouter)
            view.interactor = interactor
            view.wireframe = wireframe
            interactor?.parameters = parameters
            return view
        }.inObjectScope(.transient)
    }
}
