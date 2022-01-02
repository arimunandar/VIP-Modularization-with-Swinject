//
//  Extension+UIApplication.swift
//  VIPCore
//
//  Created by Ari Munandar on 30/12/21.
//

import Foundation
import UIKit

public extension UIApplication {
    static func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        guard let window = UIApplication.shared.keyWindow else { return }
        if animated {
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (_: Bool) -> Void in
                if completion != nil {
                    completion!()
                }
            })
        } else {
            window.rootViewController = rootViewController
        }
    }

    static func getActiveNavigation() -> UINavigationController? {
        guard let root = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }

        switch root {
        case is UINavigationController:
            return root as? UINavigationController
        case is UITabBarController:
            if let selected = (root as? UITabBarController)?.selectedViewController as? UINavigationController {
                return selected
            }
        default:
            print("ROOT IS A ", root)
        }

        return nil
    }

    static func getActiveViewController() -> UIViewController? {
        guard let root = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }

        switch root {
        case is UINavigationController:
            return (root as? UINavigationController)?.children.last
        case is UITabBarController:
            if let selected = (root as? UITabBarController)?.selectedViewController as? UINavigationController {
                return selected.children.last
            }
        default:
            print("ROOT IS A ", root)
        }

        return nil
    }
}
