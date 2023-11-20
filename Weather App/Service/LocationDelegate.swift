//
//  LocationDelegate.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 19/11/23.
//

import Foundation
import CoreLocation

protocol LocationDelegate: AnyObject {
    func didReceiveCoordinates(_ coordinates: CLLocationCoordinate2D?)
}
