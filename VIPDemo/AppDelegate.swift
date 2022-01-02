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
import VIPSocial
import VIPSocialApi
import VIPFinanceApi

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
            AppProducts.VIPFinanceProducts.productName: { VIPFinanceRouters(router: $0) },
            AppProducts.VIPSocialProducts.productName: { VIPSocialRouters(router: $0) }
        ]
        
        var assemblies: [Assembly] = []
        assemblies.append(contentsOf: VIPFinanceRouters.getAssemblies())
        assemblies.append(contentsOf: VIPSocialRouters.getAssemblies())

        AppRouter.setAppRouter(products: products, assemblies: VIPSocialRouters.getAssemblies())
        AppRouter.shared.presentModule(module: VIPSocialProducts.SocialHomeModule, presentType: .root)
        return true
    }
}
