//
//  ListCarRepairSummaryViewControllerConfigureLocation.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import CoreLocation

extension ListCarRepairSummaryViewController: CLLocationManagerDelegate {
    func configureLocation() {
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager?.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            self.locationManager?.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location else {
            return
        }

        self.coordinate = location.coordinate
        self.startRequest(withLocation: self.currentLocation())
    }

    func currentLocation() -> String {
        let currentLocation = self.convertCoordinateToString(self.coordinate)

        return currentLocation
    }

    internal func convertCoordinateToString(_ coordinate: CLLocationCoordinate2D?) -> String {
        guard let coordinate = coordinate else {
            return ""
        }

        return "\(coordinate.latitude), \(coordinate.longitude)"
    }

    internal func convertAddressToCoordinate(_ address: String, completion: @escaping(CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if error != nil {
                completion(nil)
            }

            let placemark = placemarks?.first
            let location = placemark?.location

            if let coordinate = location?.coordinate {
                completion(coordinate)
            }

            completion(nil)
        }
    }
}
