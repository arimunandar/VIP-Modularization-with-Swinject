//
//  SocialHomeWireframe.swift
//  VIPSocial
//
//  Created by Ari Munandar on 02/01/22.
//  Copyright (c) 2022 Stockbit - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

// MARK: - SocialHomeViewControllerDelegate

protocol SocialHomeViewControllerDelegate: AnyObject {
    // do someting...
}

// MARK: - ISocialHomeWireframe

protocol ISocialHomeWireframe {
    func presentView(viewController: SocialHomeViewController)
}

// MARK: - SocialHomeWireframe

class SocialHomeWireframe: ISocialHomeWireframe {
    var appRouter: IAppRouter
    weak var delegate: SocialHomeViewControllerDelegate?

    init(appRouter: IAppRouter, delegate: SocialHomeViewControllerDelegate?) {
        self.appRouter = appRouter
        self.delegate = delegate
    }

    func presentView(viewController: SocialHomeViewController) {
        appRouter.presentView(view: viewController)
    }
}
