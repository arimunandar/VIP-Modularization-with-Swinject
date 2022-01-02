//
//  TransactionViewController.swift
//  VIPFinance
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit

// MARK: - ITransactionViewController

protocol ITransactionViewController: AnyObject {
    // do someting...
}

// MARK: - TransactionViewController

class TransactionViewController: UIViewController {
    var interactor: ITransactionInteractor!
    var wireframe: ITransactionWireframe!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // do someting...
    }
    
    @IBAction func didPop(_ sender: UIButton) {
        wireframe?.didPop()
    }
    
    @IBAction func showDetail(_ sender: UIButton) {
        wireframe?.navigateToDetail()
    }
}

// MARK: ITransactionViewController

extension TransactionViewController: ITransactionViewController {
    // do someting...
}
