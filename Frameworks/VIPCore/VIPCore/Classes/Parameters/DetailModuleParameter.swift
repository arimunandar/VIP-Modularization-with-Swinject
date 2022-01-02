//
//  DetailModuleParameter.swift
//  VIPCore
//
//  Created by Ari Munandar on 12/12/21.
//

import Foundation

public struct DetailModuleParameter: IAppParameter {
    public var name: String
    
    public init(name: String) {
        self.name = name
    }
}

public struct HomeModuleParameter: IAppParameter {
    public var email: String
    public var gender: String
}
