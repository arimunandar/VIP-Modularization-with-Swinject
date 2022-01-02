//
//  TransactionPresenter.swift
//  VIPFinance
//
//  Created by Ari Munandar on 12/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit

// MARK: - ITransactionPresenter

protocol ITransactionPresenter: AnyObject {
    // do someting...
}

// MARK: - TransactionPresenter

class TransactionPresenter: ITransactionPresenter {
    weak var view: ITransactionViewController!

    init(view: ITransactionViewController) {
        self.view = view
    }
}
