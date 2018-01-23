//
//  CleanSwiftInteractor.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

protocol CleanSwiftInteractorInput {
    func fetchDataStore(_ request: CleanSwift.MapInfos.Request)
}

protocol CleanSwiftInteractorOutput {
    func presentList(_ response: CleanSwift.MapInfos.Response)
}

protocol CleanSwiftDataStore {
    var infos: [CapitalLocation]? {get set}
}

class CleanSwiftInteractor: CleanSwiftInteractorInput, CleanSwiftDataStore {
    var worker: CleanSwiftWorker?
    var infos: [CapitalLocation]?
    var output: CleanSwiftInteractorOutput?
    
    // MARK: Do something
    
    func fetchDataStore(_ request: CleanSwift.MapInfos.Request) {
        worker = CleanSwiftWorker()
        guard let infos = worker?.fetchDataStore() else {
            return
        }
        self.infos = infos
        let response = CleanSwift.MapInfos.Response(infos: infos)
        output?.presentList(response)
    }
}
