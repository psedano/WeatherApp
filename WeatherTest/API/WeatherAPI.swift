//
//  WeatherAPI.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 20/10/23.
//

import Foundation
import UIKit

struct WeatherAPI {
    let query: String
    
    func retrieveWeatherData(completionHandler: @escaping ([SearchResultModel]) -> Void) {
        guard let url = URL(string: "\(String(format: OpenWeather.baseURL, query))appid=\(OpenWeather.apiKey)") else {
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, _, error in
            guard let data = data else {
                return
            }
            
            guard let resultModel = try? JSONDecoder().decode([SearchResultModel].self, from: data) else {
                return
            }

            completionHandler(resultModel)
        }.resume()
    }
}

struct DetailWeatherAPI {
    let latitude: Double
    let longitude: Double
    
    func retrieveWeatherDetails(completionHandler: @escaping (WeatherDetails) -> Void) {
        guard let url = URL(string: "\(OpenWeather.geolocationURL)lat=\(latitude)&lon=\(longitude)&appid=\(OpenWeather.apiKey)") else {
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, _, error in
            guard let data = data else {
                return
            }
            
            guard let resultModel = try? JSONDecoder().decode(WeatherDetails.self, from: data) else {
                return
            }
            
            completionHandler(resultModel)
        }.resume()
    }
}

struct IconWeatherAPI {
    let description: String
    
    func retrieveWeatherIcon(completionHandler: @escaping (UIImage) -> Void) {
        guard let url = URL(string: "https://openweathermap.org/img/wn/\(description)@2x.png") else {
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, _, error in
            guard let data = data else {
                return
            }
            
            guard let downloadedImage = UIImage(data: data) else {
                return
            }
            
            completionHandler(downloadedImage)
        }.resume()
    }
}
