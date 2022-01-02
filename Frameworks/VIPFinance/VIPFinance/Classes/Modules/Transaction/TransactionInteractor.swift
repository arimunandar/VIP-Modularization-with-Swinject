//
//  TransactionInteractor.swift
//  VIPFinance
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit

// MARK: - ITransactionInteractor

protocol ITransactionInteractor: AnyObject {
    // do someting...
}

// MARK: - TransactionInteractor

class TransactionInteractor: ITransactionInteractor {
    var manager: ITransactionManager!
    var presenter: ITransactionPresenter!

    init(presenter: ITransactionPresenter!, manager: ITransactionManager!) {
        self.presenter = presenter
        self.manager = manager
    }
}
