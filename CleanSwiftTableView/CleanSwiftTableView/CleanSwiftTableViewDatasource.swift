//
//  CleanSwiftTableViewDatasource.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import Foundation
import UIKit

class CleanSwiftTableViewDatasource: NSObject, UITableViewDataSource {
    var dataStore: [String]?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard dataStore != nil else {
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = dataStore else {
            return 0
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let title = dataStore?[indexPath.row]
        cell.textLabel?.text = title
        return cell
    }
}
