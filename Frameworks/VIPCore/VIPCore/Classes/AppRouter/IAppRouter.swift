//
//  IAppRouter.swift
//  VIPCore
//
//  Created by Ari Munandar on 31/12/21.
//

import Foundation
import Swinject
import UIKit

// MARK: - Private Global Variable

internal var _AppProducts: [String: (_ appRouter: IAppRouter) -> IAppProductRouter]!
internal var _Assembler: Assembler!
internal var _AppModule: AppModule?

public typealias AppDismissCallback = ((_ parameter: IAppRouterCallbackParameter?) -> Void)?

// MARK: - IAppProductRouter

public protocol IAppProductRouter: AnyObject {
    func getModule(module: AppModule, parameters: IAppParameter?) -> UIViewController?
    func presentModule(module: AppModule, parameters: IAppParameter?)
}

// MARK: - IAppRouter

public protocol IAppRouter: AnyObject {
    var resolver: Resolver { get }

    // MARK: - Get Module Handler

    func getModule(module: AppModule) -> UIViewController?
    func getModule(module: AppModule, parameters: IAppParameter?) -> UIViewController?

    // MARK: - Present Module Handler
    
    func presentModule(module: AppModule)
    func presentModule(module: AppModule, parameters: IAppParameter?)
    func presentModule(module: AppModule, presentType: AppPresentType)
    func presentModule(module: AppModule, onPresent: (() -> Void)?)
    func presentModule(module: AppModule, onDismiss: AppDismissCallback)
    func presentModule(module: AppModule, parameters: IAppParameter?, presentType: AppPresentType)
    func presentModule(module: AppModule, parameters: IAppParameter?, onPresent: (() -> Void)?)
    func presentModule(module: AppModule, parameters: IAppParameter?, onDismiss: AppDismissCallback)
    func presentModule(module: AppModule, presentType: AppPresentType, onPresent: (() -> Void)?)
    func presentModule(module: AppModule, presentType: AppPresentType, onDismiss: AppDismissCallback)
    func presentModule(module: AppModule, onPresent: (() -> Void)?, onDismiss: AppDismissCallback)
    func presentModule(module: AppModule, parameters: IAppParameter?, presentType: AppPresentType, onPresent: (() -> Void)?)
    func presentModule(module: AppModule, parameters: IAppParameter?, presentType: AppPresentType, onDismiss: AppDismissCallback)
    func presentModule(module: AppModule, presentType: AppPresentType, onPresent: (() -> Void)?, onDismiss: AppDismissCallback)
    func presentModule(module: AppModule, parameters: IAppParameter?, presentType: AppPresentType, onPresent: (() -> Void)?, onDismiss: AppDismissCallback)

    // MARK: - Present View Handler

    func presentView(view: UIViewController)

    // MARK: - Pop View Handler

    func popViewController()
    func popViewController(withIndex: Int?)
    func popViewController(parameter: IAppRouterCallbackParameter?)
    func popViewController(withIndex: Int?, parameter: IAppRouterCallbackParameter?)

    // MARK: - Pop Root View Handler

    func popRootViewController()
    func popRootViewController(parameter: IAppRouterCallbackParameter?)

    // MARK: - Dismiss View Handler

    func dismissViewController()
}
