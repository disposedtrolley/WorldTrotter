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
    var currentPin: Int = 0
    var locations: [CLLocation] = [
        CLLocation(latitude: -37.818477, longitude: 144.9666907),
        CLLocation(latitude: -37.8584039, longitude: 145.0181066)
    ]
    
    override func loadView() {
        // create a map view
        mapView = MKMapView()
        
        // add markers
        addPins()
        
        // set it as the view of this view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self,
                                   action: #selector(MapViewController.mapTypeChanged(_:)),
                                   for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = locations[currentPin]
        centreMap(location: initialLocation)
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    func addPins() {
        for location in locations {
            let mapPin = MKPointAnnotation()
            mapPin.coordinate = location.coordinate
            mapView.addAnnotation(mapPin)
        }
    }
    
    func centreMap(location: CLLocation) {
        let regionRadius: CLLocationDistance = 10000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
}
