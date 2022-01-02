//
//  AppDelegate.swift
//  VIPDemo
//
//  Created by Ari Munandar on 07/12/21.
//

import Swinject
import UIKit
import VIPCore
import VIPFinance

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // White non-transucent navigatio bar, supports dark appearance
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }

        let products: [String: (_ appRouter: IAppRouter) -> IAppProductRouter] = [
            AppProducts.VIPFinanceProducts.productName: { VIPFinanceRouters(router: $0) }
        ]

        AppRouter.setAppRouter(products: products, assemblies: VIPFinanceRouters.getAssemblies())
        AppRouter.shared.presentModule(module: VIPFinanceProducts.HomeModule, presentType: .root)
        return true
    }
}
