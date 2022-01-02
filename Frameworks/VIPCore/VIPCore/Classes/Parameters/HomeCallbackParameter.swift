//
//  HomeCallbackParameter.swift
//  VIPCore
//
//  Created by Ari Munandar on 31/12/21.
//

import Foundation

public struct HomeCallbackParameter: IAppRouterCallbackParameter {
    public var name: String
    public var from: CallbackParameterKeys
    
    public init(name: String, from: CallbackParameterKeys) {
        self.name = name
        self.from = from
    }
}
