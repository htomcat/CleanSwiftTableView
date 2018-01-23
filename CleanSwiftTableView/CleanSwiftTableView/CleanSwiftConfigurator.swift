//
//  CleanSwiftConfigurator.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import Foundation

extension CleanSwiftViewController: CleanSwiftPresenterOutput {
}

extension CleanSwiftPresenter: CleanSwiftInteractorOutput {
}

extension CleanSwiftInteractor: CleanSwiftViewControllerOutput {
}

class CleanSwiftConfigurator {
    static let shared = CleanSwiftConfigurator()

    private init() {
    }

    func configure(_ viewController: CleanSwiftViewController) {
        let presenter = CleanSwiftPresenter()
        presenter.output = viewController

        let interactor = CleanSwiftInteractor()
        interactor.output = presenter

        viewController.output = interactor

        let router = CleanSwiftRouter()
        router.viewController = viewController
        router.dataStore = interactor
        viewController.tableViewDelegate.router = router
    }
}
