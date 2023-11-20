//
//  WelcomeViewController.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 17/11/23.
//

import UIKit
import CoreLocation

class WelcomeViewController: UIViewController {
    
    private let coreLocationDelegate = LocationManager()
    
    public var onLocationTap: (() -> Void)?
    
    private lazy var welcomeView: WelcomeView = {
        let view = WelcomeView()
        
        view.onLocationTap = {[weak self] in
            self?.onLocationTap?()
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = welcomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeView.delegate(delegate: self)
    }
}

extension WelcomeViewController: LocationProtocol {
    
    public func tappedLocationButton() {
        coreLocationDelegate.requestLocation()
    }
}
