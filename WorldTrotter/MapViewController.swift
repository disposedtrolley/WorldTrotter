//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by James Liu on 22/3/17.
//  Copyright © 2017 James Liu. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        // create a map view
        mapView = MKMapView()
        
        // set it as the view of this view controller
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }
    
}
