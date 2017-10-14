//
//  CleanSwiftPresenter.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

protocol CleanSwiftPresentationLogic {
	func presentList(response: CleanSwift.MapInfos.Response)
}

class CleanSwiftPresenter: CleanSwiftPresentationLogic {
    weak var viewController: CleanSwiftDisplayLogic?
    
    // MARK: Do something
    
    func presentList(response: CleanSwift.MapInfos.Response) {
        let viewModel = CleanSwift.MapInfos.ViewModel(infos: response.infos)
        viewController?.displayList(viewModel: viewModel)
    }
}
