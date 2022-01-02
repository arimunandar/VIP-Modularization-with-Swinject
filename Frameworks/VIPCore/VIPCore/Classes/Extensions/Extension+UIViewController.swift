//
//  Extension+UIViewController.swift
//  VIPCore
//
//  Created by Ari Munandar on 30/12/21.
//

import Foundation
import UIKit

extension UIViewController {
    private enum AssociatedKeys {
        static var DescriptiveName = "nsh_DescriptiveName"
    }

    var routePath: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName) as? String
        }

        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.DescriptiveName,
                    newValue as NSString?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
}
