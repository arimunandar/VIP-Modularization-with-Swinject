//
//  DetailModule.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

public class DetailModule: IAppModule {
    let appRouter: IAppRouter

    public init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    public func presentView(parameters: IAppParameter?) {
        let wireframe = appRouter.resolver.resolve(IDetailWireframe.self, argument: appRouter)!
        wireframe.presentView(parameters: parameters as? DetailModuleParameter)
    }

    public func createView(parameters: IAppParameter?) -> UIViewController {
        let view = appRouter.resolver.resolve(DetailViewController.self, arguments: appRouter, parameters as? DetailModuleParameter)!
        return view
    }
}
