//
//  LocationEnableVC.swift
//  Agri Reach
//
//  Created by Kiran on 05/05/22.
//

import UIKit

class LocationEnableVC: UIViewController {

    @IBOutlet weak var turnOnBtn: UIButton!
    var locationManager:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.turnOnBtn.applyButtonShadow(color: UIColor.primaryColor , offSet: CGSize(width: -1, height: 1),radius : 20, cornorRadius: self.turnOnBtn.frame.height / 2)


    }
    
    @IBAction func turnONbtn(_ sender: Any) {
        locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()

            if CLLocationManager.locationServicesEnabled(){
                locationManager.startUpdatingLocation()
            }

        
    }
}

import CoreLocation

extension LocationEnableVC : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation

        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")

//        self.labelLat.text = "\(userLocation.coordinate.latitude)"
//        self.labelLongi.text = "\(userLocation.coordinate.longitude)"

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
                print(placemark.locality!)
                print(placemark.administrativeArea!)
                print(placemark.country!)

                let location = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
                print(location)
            }
        }

    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}
