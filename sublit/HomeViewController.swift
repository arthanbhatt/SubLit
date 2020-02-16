//
//  HomeViewController.swift
//  sublit
//
//  Created by Vivek Cherian on 2/15/20.
//  Copyright © 2020 Vivek Cherian. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate  {
    @IBOutlet weak var sublitMap: MKMapView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var msgButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    
    let locationManager = CLLocationManager()
    

    @IBAction func homePress(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyRoundCorner(profileButton)
        profileButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        applyRoundCorner(msgButton)
        msgButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        applyRoundCorner(homeButton)
        homeButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        sublitMap.delegate = self
        sublitMap.mapType = .standard
        sublitMap.isZoomEnabled = true
        sublitMap.isScrollEnabled = true
        
        if let coor = sublitMap.userLocation.location?.coordinate{
            sublitMap.setCenter(coor, animated: true)
        }
        
    }


    func applyRoundCorner(_ object: AnyObject)
    {
        object.layer.cornerRadius = object.frame.size.width / 2
        object.layer?.masksToBounds = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue = CLLocationCoordinate2D(latitude: 37.793950, longitude: -122.418060)
        
        sublitMap.mapType = MKMapType.standard
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        sublitMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "Arthan Bhatt"
        annotation.subtitle = "current location"
        sublitMap.addAnnotation(annotation)
        
//        centerMap(locValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pinSegue" {
//            let userViewController = segue.destination
            performSegue(withIdentifier: "pinSegue", sender: nil)
        }
    }

}

extension HomeViewController {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        performSegue(withIdentifier: "pinSegue", sender: nil)
    }
}
