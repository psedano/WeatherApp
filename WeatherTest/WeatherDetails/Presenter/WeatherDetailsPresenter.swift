//
//  DetailPresenter.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 31/10/23.
//

import Foundation

class WeatherDetailsPresenter {
    var view: WeatherDetailsViewable?
    
    init(view: WeatherDetailsViewable) {
        self.view = view
    }
}

extension WeatherDetailsPresenter: WeatherDetailsPresentable {
    func retrieveWeatherDetails(latitude: Double, longitude: Double) {
        let detailAPI = DetailWeatherAPI(latitude: latitude,
                                         longitude: longitude)
        
        detailAPI.retrieveWeatherDetails { [weak self] details in
            DispatchQueue.main.async {
                self?.view?.setupTextFields(model: details)
                
                guard let firstElement = details.weather.first?.icon else {
                    return
                }
                
                let imageAPI = IconWeatherAPI(description: firstElement)
                
                imageAPI.retrieveWeatherIcon { [weak self] downloadedImage in
                    DispatchQueue.main.async {
                        self?.view?.setupWeatherImage(image: downloadedImage)
                    }
                }
            }
        }
    }
}
