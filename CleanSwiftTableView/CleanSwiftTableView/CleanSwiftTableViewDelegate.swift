//
//  CleanSwiftTableViewDelegate.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import Foundation
import UIKit

class CleanSwiftTableViewDelegate: NSObject, UITableViewDelegate {
    var router: CleanSwiftRouter?

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeMapView(at: indexPath)
    }
}
