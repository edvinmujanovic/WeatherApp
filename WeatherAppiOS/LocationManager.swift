//
//  LocationManager.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-23.
//

import CoreLocation
import Observation

/*tutorial used for getting a location: https://dwirandyh.medium.com/deep-dive-into-core-location-in-ios-a-step-by-step-guide-to-requesting-and-utilizing-user-location-fe8325462ea9 */

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    var currentLocation: CLLocationCoordinate2D?
    /*private let geocoder = CLGeocoder()  Fixa så man ser staden?
    var location: CLLocation?
    var address: CLPlacemark? */
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.distanceFilter = 10.0
        self.locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.first?.coordinate else {
            print("No user location available")
            return
        }
        self.currentLocation = userLocation
        print("Did update locations. New Location: \(userLocation)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager Error: \(error.localizedDescription)")
    }
}
