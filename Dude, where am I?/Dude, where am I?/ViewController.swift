//
//  ViewController.swift
//  Dude, where am I?
//
//  Created by Christopher Myers on 7/11/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        
    }

    
    
    
    @IBAction func findLocation(sender: UIBarButtonItem) {
        
        
    }
    
    
    
    @IBAction func pinMePressed(sender: UIBarButtonItem) {
        
        
        
    }

}

