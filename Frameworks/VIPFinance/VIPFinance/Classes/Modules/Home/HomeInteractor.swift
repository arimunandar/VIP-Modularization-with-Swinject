//
//  HomeInteractor.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

// MARK: - IHomeInteractor

protocol IHomeInteractor: AnyObject {
    
}

// MARK: - HomeInteractor

class HomeInteractor: IHomeInteractor {
    var manager: IHomeManager!
    var presenter: IHomePresenter!

    init(presenter: IHomePresenter!, manager: IHomeManager!) {
        self.presenter = presenter
        self.manager = manager
    }
}
