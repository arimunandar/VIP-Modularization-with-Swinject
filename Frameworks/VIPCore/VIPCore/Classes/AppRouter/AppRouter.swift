//
//  AppRouter.swift
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import Foundation
import Swinject
import UIKit

// MARK: - AppRouter

public class AppRouter: NSObject, IAppRouter {
    // MARK: - Public Static Variables

    public static var shared = AppRouter(products: _AppProducts, assembler: _Assembler)
    public var resolver: Resolver { assembler.resolver }

    // MARK: - Private Variables

    private var window: UIWindow? = UIApplication.shared.keyWindow
    private var presentType: AppPresentType = .push
    private let assembler: Assembler
    private let products: [String: (_ appRouter: IAppRouter) -> IAppProductRouter]
    private var appModuleStacks: [AppModuleStack] = []
    private var onPresent: (() -> Void)?
    private var onDismiss: AppDismissCallback?

    public class func setAppRouter(products: [String: (_ appRouter: IAppRouter) -> IAppProductRouter], assemblies: [Assembly]) {
        let assembler = Assembler()
        assembler.apply(assemblies: assemblies)
        _AppProducts = products
        _Assembler = assembler
    }

    init(products: [String: (_ appRouter: IAppRouter) -> IAppProductRouter], assembler: Assembler) {
        self.products = products
        self.assembler = assembler
    }
}

public extension AppRouter {
    // MARK: - Get Module Handler

    func getModule(module: AppModule) -> UIViewController? {
        getModule(module: module, parameters: nil)
    }

    func getModule(module: AppModule, parameters: IAppParameter?) -> UIViewController? {
        if let productConstuctor = products[module.productName] {
            let product = productConstuctor(self)
            return product.getModule(module: module, parameters: parameters)
        }
        return nil
    }

    // MARK: - Present Module Handler

    func presentModule(module: AppModule) {
        presentModule(module: module, parameters: nil, presentType: .push, onPresent: nil, onDismiss: nil)
    }

    func presentModule(module: AppModule, parameters: IAppParameter?) {
        presentModule(module: module, parameters: parameters, presentType: .push, onPresent: nil, onDismiss: nil)
    }

    func presentModule(module: AppModule, presentType: AppPresentType) {
        presentModule(module: module, parameters: nil, presentType: presentType, onPresent: nil, onDismiss: nil)
    }

    func presentModule(module: AppModule, onPresent: (() -> Void)?) {
        presentModule(module: module, parameters: nil, presentType: .push, onPresent: onPresent, onDismiss: nil)
    }

    func presentModule(module: AppModule, onDismiss: AppDismissCallback) {
        presentModule(module: module, parameters: nil, presentType: .push, onPresent: nil, onDismiss: onDismiss)
    }

    func presentModule(module: AppModule, parameters: IAppParameter?, presentType: AppPresentType) {
        presentModule(module: module, parameters: parameters, presentType: presentType, onPresent: nil, onDismiss: nil)
    }

    func presentModule(module: AppModule, parameters: IAppParameter?, onPresent: (() -> Void)?) {
        presentModule(module: module, parameters: parameters, presentType: .push, onPresent: onPresent, onDismiss: nil)
    }

    func presentModule(module: AppModule, parameters: IAppParameter?, onDismiss: AppDismissCallback) {
        presentModule(module: module, parameters: parameters, presentType: .push, onPresent: nil, onDismiss: onDismiss)
    }

    func presentModule(module: AppModule, presentType: AppPresentType, onPresent: (() -> Void)?) {
        presentModule(module: module, parameters: nil, presentType: presentType, onPresent: onPresent, onDismiss: nil)
    }

    func presentModule(module: AppModule, presentType: AppPresentType, onDismiss: AppDismissCallback) {
        presentModule(module: module, parameters: nil, presentType: presentType, onPresent: nil, onDismiss: onDismiss)
    }

    func presentModule(module: AppModule, onPresent: (() -> Void)?, onDismiss: AppDismissCallback) {
        presentModule(module: module, parameters: nil, presentType: .push, onPresent: onPresent, onDismiss: onDismiss)
    }

    func presentModule(module: AppModule, parameters: IAppParameter?, presentType: AppPresentType, onPresent: (() -> Void)?) {
        presentModule(module: module, parameters: parameters, presentType: presentType, onPresent: onPresent, onDismiss: nil)
    }

    func presentModule(module: AppModule, presentType: AppPresentType, onPresent: (() -> Void)?, onDismiss: AppDismissCallback) {
        presentModule(module: module, parameters: nil, presentType: presentType, onPresent: onPresent, onDismiss: onDismiss)
    }

    func presentModule(module: AppModule, parameters: IAppParameter?, presentType: AppPresentType, onDismiss: AppDismissCallback) {
        presentModule(module: module, parameters: parameters, presentType: presentType, onPresent: nil, onDismiss: onDismiss)
    }

    func presentModule(module: AppModule, parameters: IAppParameter?, presentType: AppPresentType, onPresent: (() -> Void)?, onDismiss: AppDismissCallback) {
        _AppModule = module
        self.presentType = presentType
        self.onDismiss = onDismiss
        self.onPresent = onPresent

        if let productConstuctor = products[module.productName] {
            let product = productConstuctor(self)
            product.presentModule(module: module, parameters: parameters)
        }
    }

    func presentView(view: UIViewController) {
        if let last = UIApplication.getActiveNavigation()?.viewControllers.last {
            appModuleStacks.append(AppModuleStack(viewController: last, routerPath: last.routePath, onDismiss: onDismiss))
        }
        view.routePath = _AppModule?.routePath

        guard window?.rootViewController != nil else {
            if let _window = UIApplication.shared.keyWindow {
                window = _window
            } else {
                window = UIWindow(frame: UIScreen.main.bounds)
            }
            window?.makeKeyAndVisible()

            switch view {
            case is UINavigationController,
                 is UIPageViewController,
                 is UITabBarController:

                window?.rootViewController = view
            default:
                let navigationController = UINavigationController(rootViewController: view)
                window?.rootViewController = navigationController
            }
            return
        }

        switch presentType {
        case .root:
            switch view {
            case is UINavigationController,
                 is UIPageViewController,
                 is UITabBarController:
                UIApplication.switchRootViewController(rootViewController: view, animated: true)
            default:
                let navigation = UINavigationController(rootViewController: view)
                UIApplication.switchRootViewController(rootViewController: navigation, animated: true)
            }
        case .push:
            UIApplication.getActiveNavigation()?.pushViewController(viewController: view, animated: true, completion: { [weak self] in
                self?.onPresent?()
            })
        case .present:
            UIApplication.getActiveNavigation()?.present(view, animated: true) { [weak self] in
                self?.onPresent?()
            }
        }
    }

    // MARK: - Pop View Handler

    func popViewController() {
        popViewController(withIndex: nil, parameter: nil)
    }

    func popViewController(withIndex: Int?) {
        popViewController(withIndex: withIndex, parameter: nil)
    }

    func popViewController(parameter: IAppRouterCallbackParameter?) {
        popViewController(withIndex: nil, parameter: parameter)
    }

    func popViewController(withIndex: Int?, parameter: IAppRouterCallbackParameter?) {
        if let withIndex = withIndex {
            if withIndex < ((UIApplication.getActiveNavigation()?.viewControllers.count ?? 0) - 1) {
                if withIndex == 0 {
                    UIApplication.getActiveNavigation()?.popToRootViewController(animated: true, completion: { [weak self] in
                        if let vc = UIApplication.getActiveNavigation()?.viewControllers.first {
                            if let x = self?.appModuleStacks.first(where: { $0.viewController == vc }), let onDismiss = x.onDismiss {
                                onDismiss?(parameter)
                            }
                        }
                        self?.appModuleStacks.removeSubrange(withIndex..<(self?.appModuleStacks.count ?? 0))
                    })
                } else {
                    guard let vc = UIApplication.getActiveNavigation()?.viewControllers[withIndex] else {
                        print("""
                        YOUR DESTINATION VIEW CONTROLLER NOT FOUND!!!
                        """)
                        return
                    }
                    UIApplication.getActiveNavigation()?.popToViewController(viewController: vc, animated: true, completion: { [weak self] in
                        if let x = self?.appModuleStacks.first(where: { $0.viewController == vc }), let onDismiss = x.onDismiss {
                            onDismiss?(parameter)
                        }
                        self?.appModuleStacks.removeSubrange(withIndex..<(self?.appModuleStacks.count ?? 0))
                    })
                }
            }
        } else {
            UIApplication.getActiveNavigation()?.popViewController(animated: true, completion: { [weak self] in
                if let x = self?.appModuleStacks.last, let onDismiss = x.onDismiss {
                    onDismiss?(parameter)
                }
                self?.appModuleStacks.removeLast()
            })
        }
    }

    func popRootViewController() {
        popRootViewController(parameter: nil)
    }

    func popRootViewController(parameter: IAppRouterCallbackParameter?) {
        UIApplication.getActiveNavigation()?.popToRootViewController(animated: true, completion: { [weak self] in
            if let vc = UIApplication.getActiveNavigation()?.viewControllers.first {
                if let x = self?.appModuleStacks.first(where: { $0.viewController == vc }), let onDismiss = x.onDismiss {
                    onDismiss?(parameter)
                }
            }
            self?.appModuleStacks.removeSubrange(0..<(self?.appModuleStacks.count ?? 0))
        })
    }

    func dismissViewController() {
        UIApplication.getActiveNavigation()?.dismiss(animated: true, completion: nil)
    }
}
