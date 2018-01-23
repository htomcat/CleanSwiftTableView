//
//  CleanSwiftPresenter.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

protocol CleanSwiftPresenterInput {
	func presentList(_ response: CleanSwift.MapInfos.Response)
}

protocol CleanSwiftPresenterOutput: class {
    func displayList(_ viewModel: CleanSwift.MapInfos.ViewModel)
}

class CleanSwiftPresenter: CleanSwiftPresenterInput {
    weak var output: CleanSwiftPresenterOutput?
    
    // MARK: Do something
    
    func presentList(_ response: CleanSwift.MapInfos.Response) {
        let viewModel = CleanSwift.MapInfos.ViewModel(infos: response.infos)
        output?.displayList(viewModel)
    }
}
