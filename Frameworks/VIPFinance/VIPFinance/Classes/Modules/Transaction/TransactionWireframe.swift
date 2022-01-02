//
//  TransactionWireframe.swift
//  VIPFinance
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

// MARK: - ITransactionWireframe

protocol ITransactionWireframe {
    func presentView()
    func createHomeViewController() -> UIViewController
    func didPop()
    func navigateToDetail()
}

// MARK: - TransactionWireframe

class TransactionWireframe: ITransactionWireframe {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView() {
        let view = appRouter.resolver.resolve(TransactionViewController.self, argument: appRouter)!
        appRouter.presentView(view: view)
    }
    
    func createHomeViewController() -> UIViewController {
        guard let vc = appRouter.getModule(module: VIPFinanceProducts.HomeModule) else {
            fatalError("HomeViewController not found!!!")
        }
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        return UINavigationController(rootViewController: vc)
    }
    
    func didPop() {
        let x = HomeCallbackParameter(name: "SAMSUL", from: .fromTransaction)
        appRouter.popRootViewController(parameter: x)
    }
    
    func navigateToDetail() {
        appRouter.presentModule(module: VIPFinanceProducts.DetailModule)
    }
}
