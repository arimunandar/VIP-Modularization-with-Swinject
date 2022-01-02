//
//  TransactionModule.swift
//  VIPFinance
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

// MARK: - TransactionModule

public class TransactionModule: IAppModule {
    let appRouter: IAppRouter

    public init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    public func presentView(parameters: IAppParameter?) {
        let wireframe = appRouter.resolver.resolve(ITransactionWireframe.self, argument: appRouter)!
        wireframe.presentView()
    }

    public func createView(parameters: IAppParameter?) -> UIViewController {
        let view = appRouter.resolver.resolve(TransactionViewController.self, argument: appRouter)!
        return view
    }
}
