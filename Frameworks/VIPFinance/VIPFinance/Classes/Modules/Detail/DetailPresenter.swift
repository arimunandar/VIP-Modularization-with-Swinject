//
//  DetailPresenter.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit

// MARK: - IDetailPresenter

protocol IDetailPresenter: AnyObject {
    // do someting...
}

// MARK: - DetailPresenter

class DetailPresenter: IDetailPresenter {
    weak var view: IDetailViewController!

    init(view: IDetailViewController!) {
        self.view = view
    }
}
