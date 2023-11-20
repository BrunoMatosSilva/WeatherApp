//
//  AlertController.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 20/11/23.
//

import Foundation
import UIKit

class AlertController: NSObject {
    
    private var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func showLocationPermissionDeniedAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) {share in
            completion?()
        }
        alertController.addAction(ok)
        self.controller.present(alertController, animated: true)
    }
}
