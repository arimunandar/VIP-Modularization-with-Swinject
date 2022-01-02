//
//  SocialHomeAssembly.swift
//  VIPCore
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import Foundation
import Swinject
import VIPCore

class SocialHomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ISocialHomeManager.self) {(r) in
            return SocialHomeManager()
        }.inObjectScope(.transient)
        
        container.register(ISocialHomeWireframe.self) { (_, appRouter: IAppRouter, delegate: SocialHomeViewControllerDelegate) in
            SocialHomeWireframe(appRouter: appRouter, delegate: delegate)
        }.inObjectScope(.transient)

        container.register(ISocialHomeInteractor.self) { (r, view: ISocialHomeViewController) in
            let presenter = r.resolve(ISocialHomePresenter.self, argument: view)
            let manager = r.resolve(ISocialHomeManager.self)
            let interactor = SocialHomeInteractor(presenter: presenter, manager: manager)
            return interactor
        }.inObjectScope(.transient)

        container.register(ISocialHomePresenter.self) { (_, view: ISocialHomeViewController) in
            let presenter = SocialHomePresenter(view: view)
            return presenter
        }.inObjectScope(.transient)

        container.register(SocialHomeViewController.self) { (r, appRouter: IAppRouter) in
            let bundle = Bundle(for: type(of: self))
            let view = SocialHomeViewController(nibName: "SocialHomeViewController", bundle: bundle)
            let interactor = r.resolve(ISocialHomeInteractor.self, argument: view as ISocialHomeViewController)
            let wireframe = r.resolve(ISocialHomeWireframe.self, arguments: appRouter, view as SocialHomeViewControllerDelegate)
            view.interactor = interactor
            view.wireframe = wireframe
            return view
        }.inObjectScope(.transient)
    }
}
