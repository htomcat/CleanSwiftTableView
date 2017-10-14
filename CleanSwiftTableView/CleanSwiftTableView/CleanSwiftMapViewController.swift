//
//  CleanSwiftMapViewController.swift
//  CleanSwiftTableView
//
//  Created by htomcat on 2017/10/14.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit
import MapKit

class CleanSwiftMapViewController: UIViewController {
    var coordinates: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapView = MKMapView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: UIScreen.main.bounds.width,
                                             height: view.bounds.height))
        guard let coordinates = coordinates else {
            return
        }
        mapView.region = MKCoordinateRegion(center: coordinates, span: MKCoordinateSpanMake(1.0, 1.0))
        view.addSubview(mapView)
    }
}
