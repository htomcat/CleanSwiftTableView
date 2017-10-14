//
//  CleanSwiftInteractor.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

protocol CleanSwiftBusinessLogic {
    func fetchDataStore(request: CleanSwift.MapInfos.Request)
}

protocol CleanSwiftDataStore {
    var infos: [CapitalLocation]? {get set}
}

class CleanSwiftInteractor: CleanSwiftBusinessLogic, CleanSwiftDataStore {
    var presenter: CleanSwiftPresentationLogic?
    var worker: CleanSwiftWorker?
    var infos: [CapitalLocation]?
    
    // MARK: Do something
    
    func fetchDataStore(request: CleanSwift.MapInfos.Request) {
        worker = CleanSwiftWorker()
        guard let infos = worker?.fetchDataStore() else {
            return
        }
        self.infos = infos
        let response = CleanSwift.MapInfos.Response(infos: infos)
        presenter?.presentList(response: response)
    }
}
