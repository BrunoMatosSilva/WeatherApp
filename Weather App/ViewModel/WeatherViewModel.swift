//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 18/11/23.
//

import Foundation

// MARK: - WeatherViewModel
struct WeatherViewModel: Codable {
    var coord: Coord
    var weather: [Weather]
    var main: Main
    var wind: Wind
    var name: String
}

// MARK: - Coord
struct Coord: Codable {
    var lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    var temp, feelsLike, tempMin, tempMax: Double
    var pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Weather
struct Weather: Codable {
    var id: Int
    var main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    var speed: Double
    var deg: Int
}

