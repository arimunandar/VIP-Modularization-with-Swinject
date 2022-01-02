//
//  DetailWireframe.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

// MARK: - IDetailWireframe

protocol IDetailWireframe {
    func presentView(parameters: DetailModuleParameter?)
    func didPop()
    func navigateToTransaction()
}

// MARK: - DetailWireframe

class DetailWireframe: IDetailWireframe {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: DetailModuleParameter?) {
        let view = appRouter.resolver.resolve(DetailViewController.self, arguments: appRouter, parameters)!
        appRouter.presentView(view: view)
    }

    func didPop() {
        let x = HomeCallbackParameter(name: "OTONG", from: .fromDetail)
        appRouter.popViewController(parameter: x)
    }

    func navigateToTransaction() {
        appRouter.presentModule(module: VIPFinanceProducts.TransactionModule, onDismiss: { _ in
            // do someting
        })
    }
}
