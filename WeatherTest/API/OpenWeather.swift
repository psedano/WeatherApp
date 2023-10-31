//
//  OpenWeather.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 20/10/23.
//

import Foundation

struct OpenWeather {
    static let baseURL = "https://api.openweathermap.org/geo/1.0/direct?q=%@&limit=15&"
//    static let baseURL = "https://api.openweathermap.org/data/2.5/weather?oq=@"
    static let geolocationURL = "https://api.openweathermap.org/data/2.5/weather?"
    static let apiKey = "3298144d3eca9faf5e170662a8dd2a0c"
}
