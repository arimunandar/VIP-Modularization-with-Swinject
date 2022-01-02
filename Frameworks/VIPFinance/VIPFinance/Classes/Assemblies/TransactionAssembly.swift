//
//  TransactionAssembly.swift
//  VIPFinance
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import Foundation
import Swinject
import UIKit
import VIPCore

// MARK: - TransactionAssembly

class TransactionAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ITransactionManager.self) { _ in
            TransactionManager()
        }.inObjectScope(.transient)

        container.register(ITransactionWireframe.self) { (_, appRouter: IAppRouter) in
            TransactionWireframe(appRouter: appRouter)
        }.inObjectScope(.transient)

        container.register(ITransactionInteractor.self) { (r, view: ITransactionViewController) in
            let presenter = r.resolve(ITransactionPresenter.self, argument: view)!
            let manager = r.resolve(ITransactionManager.self)!
            let interactor = TransactionInteractor(presenter: presenter, manager: manager)
            return interactor
        }.inObjectScope(.transient)

        container.register(ITransactionPresenter.self) { (_, view: ITransactionViewController) in
            let presenter = TransactionPresenter(view: view)
            return presenter
        }.inObjectScope(.transient)

        container.register(TransactionViewController.self) { (r, appRouter: IAppRouter) in
            let bundle = Bundle(for: type(of: self))
            let view = TransactionViewController(nibName: "TransactionViewController", bundle: bundle)
            let interactor = r.resolve(ITransactionInteractor.self, argument: view as ITransactionViewController)!
            let wireframe = r.resolve(ITransactionWireframe.self, argument: appRouter)!
            view.interactor = interactor
            view.wireframe = wireframe
            return view
        }.inObjectScope(.transient)
    }
}
