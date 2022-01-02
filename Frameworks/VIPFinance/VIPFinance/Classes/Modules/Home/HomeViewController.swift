//
//  HomeViewController.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit

// MARK: - IHomeViewController

protocol IHomeViewController: AnyObject {
    // do someting...
}

// MARK: - HomeViewController

public class HomeViewController: UIViewController {
    var interactor: IHomeInteractor!
    var wireframe: IHomeWireframe!

    @IBOutlet weak var titleLabel: UILabel!

    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didShow(_ sender: UIButton) {
        wireframe.navigateToDetail()
    }

    @IBAction func didPop(_ sender: UIButton) {
        // do someting...
    }

    @IBAction func didPopRoot(_ sender: UIButton) {
        // do someting...
    }
}

// MARK: IHomeViewController

extension HomeViewController: IHomeViewController {
    // do someting...
}

// MARK: HomeViewControllerDelegate

extension HomeViewController: HomeViewControllerDelegate {
    func didSetupNewTitleLabel(text: String?) {
        titleLabel.text = text
    }
}
