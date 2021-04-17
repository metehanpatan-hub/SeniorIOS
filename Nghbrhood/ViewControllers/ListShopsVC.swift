//
//  ListShopsVC.swift
//  Nghbrhood
//
//  Created by CTIS Student on 28.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ListShopsVC: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {

    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        setupMapView()
        checkLocationServices()
        let loc = CLLocationCoordinate2DMake(39.881556, 32.760431)
        setPinUsingMKPointAnnotation(location: loc)
    }
    func setupMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         guard let location = locations.last else { return }
         let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
         mapView.setRegion(region, animated: true)
     }
    
     func checkLocationAuthorization() {
         switch CLLocationManager.authorizationStatus() {
         case .authorizedWhenInUse:
             mapView.showsUserLocation = true
             followUserLocation()
             locationManager.startUpdatingLocation()
             break
         case .denied:
             // Show alert
             break
         case .notDetermined:
             locationManager.requestWhenInUseAuthorization()
         case .restricted:
             // Show alert
             break
         case .authorizedAlways:
             break
         }
     }
     
     func checkLocationServices() {
         if CLLocationManager.locationServicesEnabled() {
             setupLocationManager()
             checkLocationAuthorization()
         } else {
             // the user didn't turn it on
         }
     }
     
     func followUserLocation() {
         if let location = locationManager.location?.coordinate {
             let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 4000, longitudinalMeters: 4000)
             mapView.setRegion(region, animated: true)
         }
     }
     
     func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
         checkLocationAuthorization()
     }
     
     func setupLocationManager() {
         locationManager.delegate = self
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
     }
    func setPinUsingMKPointAnnotation(location: CLLocationCoordinate2D){
       let annotation = MKPointAnnotation()
       annotation.coordinate = location
       annotation.title = "Cagdas Market"
       annotation.subtitle = "Supermarket in Bilkent 2"
       let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 39.881556, longitudinalMeters: 32.760431)
       mapView.setRegion(coordinateRegion, animated: true)
       mapView.addAnnotation(annotation)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
    */

}
