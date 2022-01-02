//
//  GeneralProducts.swift
//  VIPCore
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import Foundation

public enum GeneralProducts: AppModule {
    case HomeModule

    public var productName: String {
        return "GeneralProducts"
    }

    public var routePath: String {
        switch self {
        case .HomeModule:
            return "/vip/home"
        }
    }
}
