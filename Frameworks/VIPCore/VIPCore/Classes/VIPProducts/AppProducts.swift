//
//  AppModule.swift
//  ARTDEVCommon
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import Foundation
import UIKit

// MARK: - AppProducts

public enum AppProducts {
    case VIPFinanceProducts
    case VIPSocialProducts

    public var productName: String {
        switch self {
        case .VIPFinanceProducts:
            return "VIPFinanceProducts"
        case .VIPSocialProducts:
            return "VIPSocialProducts"
        }
    }
}
