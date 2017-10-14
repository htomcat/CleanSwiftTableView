//
//  CleanSwiftWorker.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//
//

import UIKit
import CoreLocation

class CleanSwiftWorker {
    let infos: [[String: Any]] = [["name": "US, Washington, D.C.",
                                   "latitude": 38.9072,
                                   "longitude": -77.0369],
                                  ["name": "Canada, Ottawa",
                                   "latitude": 45.4215,
                                   "longitude": -75.6972],
                                  ["name": "Brazil, Brasilia",
                                   "latitude": -15.7942,
                                   "longitude": -47.8825],
                                  ["name": "UK, London",
                                   "latitude": 51.5074,
                                   "longitude": -0.1278],
                                  ["name": "Spain, Madrid",
                                   "latitude": 40.4168,
                                   "longitude": -3.7038],
                                  ["name": "France, Paris",
                                   "latitude": 48.8566,
                                   "longitude": 2.3522],
                                  ["name": "Italy, Rome",
                                   "latitude": 41.9028,
                                   "longitude": 12.4964],
                                  ["name": "Germany, Berlin",
                                   "latitude": 52.5200,
                                   "longitude": 13.4050]]
    func fetchDataStore() -> [CapitalLocation] {
        var capitalLocations = [CapitalLocation]()
        infos.forEach { info in
            let capitalLocation = CapitalLocation(capital: info["name"] as? String ?? "",
                                                  location: CLLocationCoordinate2D(latitude: info["latitude"] as? CLLocationDegrees ?? 0.0,
                                                                                   longitude: info["longitude"] as? CLLocationDegrees ?? 0.0))
            capitalLocations.append(capitalLocation)
        }
        return capitalLocations
    }
}
