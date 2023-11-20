//
//  Coordinator.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 17/11/23.
//

import UIKit

class WelcomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController

    func start() {
        let viewController = WelcomeViewController()
        
        viewController.onLocationTap = {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
