//
//  CleanSwiftModels.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit

enum CleanSwift {
    // MARK: Use cases
    
    enum MapInfos {
        struct Request {
        }
        struct Response {
            let infos: [CapitalLocation]
        }
        struct ViewModel {
            let infos: [CapitalLocation]
        }
    }
}
