//
//  ViewController.swift
//  Where Was I
//
//  Created by Alexey Yarov on 17.06.2021.
//  Copyright © 2021 Alexey Yarov. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBAction func SaveButtonClicked(_ sender: UIBarButtonItem) {
        let coord = locationManager.location?.coordinate
        if let lat = coord?.latitude{
            if let long = coord?.longitude{
                DataStore().StoreDataPoint(latitude: String(lat), longitude: String(long))
                UpdateSavedPin()
            }
    }
    }
    let locationManager = CLLocationManager ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        UpdateSavedPin()
    }

    func UpdateSavedPin(){
        if let oldCoord = DataStore().GetLastLocation(){
            let annoRem = mapView.annotations.filter {$0 !== mapView.userLocation}
            mapView.removeAnnotations(annoRem)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(oldCoord.latitude)! //dead shure that it is double and it exists
            annotation.coordinate.longitude = Double(oldCoord.longitude)!
            
            annotation.title = "I was here!"
            annotation.subtitle = "Remember?"
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            print("Location not enabled")
            return
        } //if we authorized this our app, then this func will not be fired
        
        print("Location allowed")
        mapView.showsUserLocation = true //not nessesary, because we turned it on MainStoryboard
    }

}

