//
//  DetailInteractor.swift
//  VIPFinance
//
//  Created by Ari Munandar on 11/12/21.
//  Copyright (c) 2021 ARTDEV INDONESIA - ARI MUNANDAR. All rights reserved.

import UIKit
import VIPCore

// MARK: - IDetailInteractor

protocol IDetailInteractor: AnyObject {
    var parameters: DetailModuleParameter? { get set }
}

// MARK: - DetailInteractor

class DetailInteractor: IDetailInteractor {
    var manager: IDetailManager!
    var presenter: IDetailPresenter!
    var parameters: DetailModuleParameter?

    init(presenter: IDetailPresenter, manager: IDetailManager) {
        self.presenter = presenter
        self.manager = manager
    }
}
