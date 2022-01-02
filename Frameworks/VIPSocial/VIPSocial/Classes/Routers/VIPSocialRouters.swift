//
//  VIPSocialRouters.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//

import Foundation
import Swinject
import VIPCore
import UIKit

public class VIPSocialRouters: IAppProductRouter {
    let router: IAppRouter

    let modules: [String: (IAppRouter) -> IAppModule] = [
        VIPSocialProducts.SocialHomeModule.routePath: { SocialHomeModule($0) }
    ]

    public init(router: IAppRouter) {
        self.router = router
    }

    public func getModule(module: AppModule, parameters: IAppParameter?) -> UIViewController? {
        if let moduleConstructor = modules[module.routePath] {
            let module = moduleConstructor(router)
            return module.createView(parameters: parameters)
        }
        return nil
    }

    public func presentModule(module: AppModule, parameters: IAppParameter?) {
        if let moduleConstructor = modules[module.routePath] {
            let module = moduleConstructor(router)
            module.presentView(parameters: parameters)
        }
    }

    open class func getAssemblies() -> [Assembly] {
        return [
            SocialHomeAssembly()
        ]
    }
}
