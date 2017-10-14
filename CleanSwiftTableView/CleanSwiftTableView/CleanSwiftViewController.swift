//
//  CleanSwiftViewController.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

protocol CleanSwiftDisplayLogic: class {
	func displaySomething(viewModel: CleanSwift.Something.ViewModel)
}

class CleanSwiftViewController: UIViewController, CleanSwiftDisplayLogic {
	var interactor: CleanSwiftBusinessLogic?
		var router: (NSObjectProtocol & CleanSwiftRoutingLogic & CleanSwiftDataPassing)?

		// MARK: Object lifecycle

		override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
			super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
				setup()
		}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
			setup()
	}

	// MARK: Setup

	private func setup() {
		let viewController = self
			let interactor = CleanSwiftInteractor()
			let presenter = CleanSwiftPresenter()
			let router = CleanSwiftRouter()
			viewController.interactor = interactor
			viewController.router = router
			interactor.presenter = presenter
			presenter.viewController = viewController
			router.viewController = viewController
			router.dataStore = interactor
	}

	// MARK: Routing

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let scene = segue.identifier {
			let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
				if let router = router, router.responds(to: selector) {
					router.perform(selector, with: segue)
				}
		}
	}

	// MARK: View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
			doSomething()
	}

	// MARK: Do something

	//@IBOutlet weak var nameTextField: UITextField!

	func doSomething() {
		let request = CleanSwift.Something.Request()
			interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: CleanSwift.Something.ViewModel) {
		//nameTextField.text = viewModel.name
	}
}
