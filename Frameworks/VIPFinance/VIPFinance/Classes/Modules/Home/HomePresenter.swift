//
//  HomePresenter.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit

// MARK: - IHomePresenter

protocol IHomePresenter: AnyObject {
    // do someting...
}

// MARK: - HomePresenter

class HomePresenter: IHomePresenter {
    weak var view: IHomeViewController!

    init(view: IHomeViewController) {
        self.view = view
    }
}
