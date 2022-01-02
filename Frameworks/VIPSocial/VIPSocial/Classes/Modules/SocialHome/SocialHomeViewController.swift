//
//  SocialHomeViewController.swift
//  VIPSocial
//
//  Created by Ari Munandar on 02/01/22.
//  Copyright (c) 2022 Stockbit - ARI MUNANDAR. All rights reserved.

import UIKit

// MARK: - ISocialHomeViewController

protocol ISocialHomeViewController: AnyObject {
    // do someting...
}

// MARK: - SocialHomeViewController

class SocialHomeViewController: UIViewController {
    var interactor: ISocialHomeInteractor?
    var wireframe: ISocialHomeWireframe?

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
    }
}

// MARK: ISocialHomeViewController

extension SocialHomeViewController: ISocialHomeViewController {
    // do someting...
}

extension SocialHomeViewController: SocialHomeViewControllerDelegate {
    // do someting...
}
