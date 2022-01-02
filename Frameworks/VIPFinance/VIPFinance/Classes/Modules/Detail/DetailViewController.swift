//
//  DetailViewController.swift
//  VIPFinance
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

// MARK: - IDetailViewController

protocol IDetailViewController: AnyObject {
    // do someting...
}

// MARK: - DetailViewController

class DetailViewController: UIViewController {
    var interactor: IDetailInteractor!
    var wireframe: IDetailWireframe!

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
    }
    
    @IBAction func didShowTransaction(_ sender: UIButton) {
        wireframe.navigateToTransaction()
    }
    
    @IBAction func didPopDetail(_ sender: UIButton) {
        wireframe.didPop()
    }
}

// MARK: IDetailViewController

extension DetailViewController: IDetailViewController {
    // do someting...
}
