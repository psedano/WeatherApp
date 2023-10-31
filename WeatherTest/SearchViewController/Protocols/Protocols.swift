//
//  Protocols.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 20/10/23.
//

import Foundation

protocol WeatherViewable {
    func reloadTableData()
    func getWeatherArray(model: [SearchResultModel])
    func cleanArray()
}

protocol WeatherPresentable {
    var lastScheduledSearch: Timer? { get }
    func cleanAndStartTimer(searchText: String)
    func startSearching(timer: Timer)
}

