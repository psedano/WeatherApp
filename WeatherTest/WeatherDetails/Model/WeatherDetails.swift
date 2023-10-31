//
//  WeatherDetails.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 30/10/23.
//

import Foundation

struct WeatherDetails: Decodable {
    let coord: Coordinates
    let weather: [WeatherInfo]
    let main: MainInformation
    let visibility: Double
    let wind: WindInfo
}

struct Coordinates: Decodable {
    let lon: Double
    let lat: Double
}

struct MainInformation: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}

struct WeatherInfo: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WindInfo: Decodable {
    let speed: Double
    let deg: Double
}
