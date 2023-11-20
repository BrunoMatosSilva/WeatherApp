//
//  Coordinator.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 19/11/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get}
    func start()
    
    init(navigationController: UINavigationController)
}
