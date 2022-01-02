//
//  SocialHomePresenter.swift
//  VIPSocial
//
//  Created by Ari Munandar on 02/01/22.
//  Copyright (c) 2022 Stockbit - ARI MUNANDAR. All rights reserved.

import UIKit

// MARK: - ISocialHomePresenter

protocol ISocialHomePresenter: AnyObject {
    // do someting...
}

// MARK: - SocialHomePresenter

class SocialHomePresenter: ISocialHomePresenter {
    weak var view: ISocialHomeViewController?

    init(view: ISocialHomeViewController?) {
        self.view = view
    }
}
