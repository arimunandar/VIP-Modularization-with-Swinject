//
//  AppModule.swift
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import Foundation
import UIKit

// MARK: - IAppModule

public protocol IAppModule {
    func presentView(parameters: IAppParameter?)
    func createView(parameters: IAppParameter?) -> UIViewController
}

// MARK: - AppModule

public protocol AppModule: IAppProduct {
    var routePath: String { get }
}

// MARK: - IAppProduct

public protocol IAppProduct {
    var productName: String { get }
}

// MARK: - AppModuleStack

struct AppModuleStack {
    var viewController: UIViewController?
    var routerPath: String?
    var onDismiss: AppDismissCallback?
}
