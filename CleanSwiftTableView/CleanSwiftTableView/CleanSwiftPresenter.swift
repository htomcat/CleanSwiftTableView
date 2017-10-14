//
//  CleanSwiftPresenter.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

protocol CleanSwiftPresentationLogic {
	func presentSomething(response: CleanSwift.Something.Response)
}

class CleanSwiftPresenter: CleanSwiftPresentationLogic {
	weak var viewController: CleanSwiftDisplayLogic?

		// MARK: Do something

		func presentSomething(response: CleanSwift.Something.Response) {
			let viewModel = CleanSwift.Something.ViewModel()
				viewController?.displaySomething(viewModel: viewModel)
		}
}
