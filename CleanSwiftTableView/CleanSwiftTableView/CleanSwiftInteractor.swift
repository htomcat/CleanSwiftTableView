//
//  CleanSwiftInteractor.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

protocol CleanSwiftBusinessLogic {
	func doSomething(request: CleanSwift.Something.Request)
}

protocol CleanSwiftDataStore {
	//var name: String { get set }
}

class CleanSwiftInteractor: CleanSwiftBusinessLogic, CleanSwiftDataStore {
	var presenter: CleanSwiftPresentationLogic?
		var worker: CleanSwiftWorker?
		//var name: String = ""

		// MARK: Do something

		func doSomething(request: CleanSwift.Something.Request) {
			worker = CleanSwiftWorker()
				worker?.doSomeWork()

				let response = CleanSwift.Something.Response()
				presenter?.presentSomething(response: response)
		}
}
