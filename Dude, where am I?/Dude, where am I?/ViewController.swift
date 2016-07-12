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
    var currentLocation = CLLocation()
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        
        if let findLoc = locationManager.location {
            self.currentLocation = findLoc
        }
        self.findLocation()
//        self.loadPin()
    }

    
    func findLocation() {
        
        let status = CLAuthorizationStatus.AuthorizedWhenInUse
        
        if status != .Denied {
            self.mapView.showsUserLocation = true
            self.locationManager.requestLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        self.findLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            let location = locations.first
            print(location?.coordinate.latitude)
            print(location?.coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            if let center = location?.coordinate {
                let region = MKCoordinateRegion(center: center, span: span)
                
                self.mapView.setRegion(region, animated: true)
                self.mapView.showsUserLocation = true
            }
        }
        print("location updated")
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
    
    func addPin(pinLat : Double, pinLong : Double, title : String, subtitle : String) {
        
        let location = CLLocationCoordinate2D(latitude: pinLat, longitude: pinLong)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        annotation.subtitle = subtitle
        
        self.mapView.addAnnotation(annotation)
    }
    
    @IBAction func updateLocation(sender: UIBarButtonItem) {
        
        self.findLocation()
    }
    
    @IBAction func pinMePressed(sender: UIBarButtonItem) {
        self.addPin(self.currentLocation.coordinate.latitude, pinLong: self.currentLocation.coordinate.longitude, title: "Somewhere", subtitle: "my address is none of yo bidness")
        
//        let savedLat = NSUserDefaults.standardUserDefaults()
        
//        savedLat.setDouble(self.currentLocation.coordinate.latitude, forKey: kSELECTED_LATITUDE)
//        savedLat.synchronize()
//        
//        
//        let savedLong = NSUserDefaults.standardUserDefaults()
//        savedLong.setDouble(self.currentLocation.coordinate.longitude, forKey: kSELECTED_LONGITUDE)
//        savedLong.synchronize()
        
    }
    
//    func loadPin() {
//        
//        let latPin = NSUserDefaults.standardUserDefaults().doubleForKey(kSELECTED_LATITUDE)
//        
//        let longPin = NSUserDefaults.standardUserDefaults().doubleForKey(kSELECTED_LONGITUDE)
//        
//        self.addPin(latPin, pinLong: longPin, title: "Somewhere", subtitle: "my address is none yo bidness")
//    }

}

