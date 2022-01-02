//
//  HomeWireframe.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

// MARK: - HomeViewControllerDelegate

protocol HomeViewControllerDelegate: AnyObject {
    func didSetupNewTitleLabel(text: String?)
}

// MARK: - IHomeWireframe

protocol IHomeWireframe {
    func presentView(viewController: HomeViewController)
    func navigateToDetail()
}

// MARK: - HomeWireframe

class HomeWireframe: IHomeWireframe {
    var appRouter: IAppRouter
    weak var delegate: HomeViewControllerDelegate?

    init(appRouter: IAppRouter, delegate: HomeViewControllerDelegate) {
        self.appRouter = appRouter
        self.delegate = delegate
    }

    func presentView(viewController: HomeViewController) {
        appRouter.presentView(view: viewController)
    }

    func navigateToDetail() {
        appRouter.presentModule(module: VIPFinanceProducts.DetailModule, onDismiss: { [weak self] parameter in
            if let x = parameter as? HomeCallbackParameter {
                switch x.from {
                case .fromTransaction:
                    self?.delegate?.didSetupNewTitleLabel(text: x.name)
                case .fromDetail:
                    self?.delegate?.didSetupNewTitleLabel(text: x.name)
                }
            }
        })
    }
}
