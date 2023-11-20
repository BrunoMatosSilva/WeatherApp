//
//  ViewController.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 15/11/23.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    private var coreLocationDelegate: LocationManager?
    private var forecastResponse: WeatherViewModel?
    private var loading: Loading?
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        return view
    }()
    
    private let service = WeatherManager()
    
    init(coreLocationDelegate: LocationManager?) {
        self.coreLocationDelegate = coreLocationDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading = Loading(viewController: self)
        loading?.show()
        loadData()
    }
    
    private func loadData() {
        coreLocationDelegate?.delegate = self
        coreLocationDelegate?.requestLocation()
    }
}

extension HomeViewController: LocationDelegate {
    
    public func didReceiveCoordinates(_ coordinates: CLLocationCoordinate2D?) {
        if let coordinates = coordinates {
            service.getCurrentWeather(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude
            ) { [weak self] response in
                guard let self = self, let weatherViewModel = response else {
                    return
                }
                
                self.forecastResponse = weatherViewModel
                
                DispatchQueue.main.async {
                    self.homeView.setupView(with: weatherViewModel)
                    self.loading?.hide()
                }
            }
        } else {
            print("Coordenadas não disponíveis.")
        }
    }
}
