//
//  SocialHomeModule.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

public class SocialHomeModule: IAppModule {
    let appRouter: IAppRouter

    public init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    public func presentView(parameters: IAppParameter?) {
        let view = appRouter.resolver.resolve(SocialHomeViewController.self, argument: appRouter)!
        let wireframe = appRouter.resolver.resolve(ISocialHomeWireframe.self, arguments: appRouter, view as SocialHomeViewControllerDelegate)!
        wireframe.presentView(viewController: view)
    }

    public func createView(parameters: IAppParameter?) -> UIViewController {
        let view = appRouter.resolver.resolve(SocialHomeViewController.self, argument: appRouter)!
        return view
    }
}
