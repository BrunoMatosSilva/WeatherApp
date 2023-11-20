//
//  WeatherAPI.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 18/11/23.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    let keyAPI:String = "170b55f855d78c8acea10f84864b9e36"
    private let session = URLSession.shared
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, _ completion: @escaping (WeatherViewModel?) -> Void) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&lang=pt_br&appid=\(keyAPI)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data  else {
                completion(nil)
                return
            }
            
            do {
                let forecastResponse = try JSONDecoder().decode(WeatherViewModel.self, from: data)
                completion(forecastResponse)
                
            } catch {
                print("Erro ao obter dados do clima: \(error)")
            }
            
            completion(nil)
        }
        
        task.resume()
    }
}
