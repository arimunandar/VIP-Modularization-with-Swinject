//
//  HomeWireframe.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

// MARK: - IHomeWireframe

protocol IHomeWireframe {
    func presentView()
    func navigateToDetail()
}

// MARK: - HomeWireframe

class HomeWireframe: IHomeWireframe {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView() {
        let view = appRouter.resolver.resolve(HomeViewController.self, argument: appRouter)!
        appRouter.presentView(view: view)
    }

    func navigateToDetail() {
        appRouter.presentModule(module: VIPFinanceProducts.DetailModule, onDismiss: { [weak self] parameter in
            print(parameter)
            if let x = parameter {
                
            }
            
//            switch fromModule {
//            case VIPFinanceProducts.DetailModule:
//                if let param = parameter as? HomeCallbackParameter {
//                    print(param.name, param.fromModule)
//                }
//            case VIPFinanceProducts.TransactionModule:
//                if let param = parameter as? HomeCallbackParameter {
//                    print(param.name, param.fromModule)
//                }
//            default:
//                break
//            }
        })
    }
}
