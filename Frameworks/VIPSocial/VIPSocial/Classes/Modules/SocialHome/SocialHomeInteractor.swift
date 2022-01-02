//
//  SocialHomeInteractor.swift
//  VIPSocial
//
//  Created by Ari Munandar on 02/01/22.
//  Copyright (c) 2022 Stockbit - ARI MUNANDAR. All rights reserved.

import UIKit

// MARK: - ISocialHomeInteractor

protocol ISocialHomeInteractor: AnyObject {
    // do someting...
}

// MARK: - SocialHomeInteractor

class SocialHomeInteractor: ISocialHomeInteractor {
    var manager: ISocialHomeManager?
    var presenter: ISocialHomePresenter?

    init(presenter: ISocialHomePresenter?, manager: ISocialHomeManager?) {
        self.presenter = presenter
        self.manager = manager
    }
}
