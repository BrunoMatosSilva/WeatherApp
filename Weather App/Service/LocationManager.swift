//
//  LocationManager.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 18/11/23.
//

import Foundation
import CoreLocation
import UIKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    weak var delegate: LocationDelegate?
    private var alertController: AlertController
    
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        self.alertController = AlertController(controller: UIViewController())
        super.init()
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            self.alertController = AlertController(controller: rootViewController)
        } else {
            self.alertController = AlertController(controller: UIViewController())
        }
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        delegate?.didReceiveCoordinates(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            requestLocation()
        case .denied, .restricted:
            showLocationPermissionDeniedAlert()
        default:
            break
        }
    }

    
    private func showLocationPermissionDeniedAlert() {
        alertController.showLocationPermissionDeniedAlert(
            title: "Permissão de Localização Necessária",
            message: "Para usar este aplicativo, a permissão de localização é necessária. Por favor, habilite a permissão nas configurações do aplicativo") {
                
                exit(0)
            }
    }
}

