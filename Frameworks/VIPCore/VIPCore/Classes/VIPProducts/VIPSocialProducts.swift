//
//  VIPSocialProducts.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import Foundation

public enum VIPSocialProducts: AppModule {
    case SocialHomeModule

    public var productName: String {
        return "VIPSocialProducts"
    }

    public var routePath: String {
        switch self {
        case .SocialHomeModule:
            return "/social/home"
        }
    }
}
