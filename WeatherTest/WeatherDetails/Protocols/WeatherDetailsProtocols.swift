//
//  WeatherDetailsProtocols.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 31/10/23.
//

import Foundation
import UIKit

protocol WeatherDetailsViewable {
    func setupTextFields(model: WeatherDetails)
    func setupWeatherImage(image: UIImage)
}

protocol WeatherDetailsPresentable {
    func retrieveWeatherDetails(latitude: Double, longitude: Double)
}
