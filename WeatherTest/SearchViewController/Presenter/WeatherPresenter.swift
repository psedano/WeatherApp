//
//  WeatherPresenter.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 31/10/23.
//

import Foundation

class WeatherPresenter {
    var view: WeatherViewable?
    var lastScheduledSearch: Timer?
    
    init(view: WeatherViewable) {
        self.view = view
    }
    
    @objc func startSearching(timer: Timer) {
        let searchText = timer.userInfo as! String
        
        if !searchText.isEmpty {
            let weatherAPI = WeatherAPI(query: searchText)
            weatherAPI.retrieveWeatherData { [weak self] resultModel in
                self?.view?.getWeatherArray(model: resultModel)
                
                DispatchQueue.main.async {
                    self?.view?.reloadTableData()
                }
            }
        } else {
            view?.cleanArray()
            view?.reloadTableData()
        }
    }
}

// Extension from passing information from View -> Presenter
extension WeatherPresenter: WeatherPresentable {
    func cleanAndStartTimer(searchText: String) {
        lastScheduledSearch?.invalidate()
        lastScheduledSearch = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startSearching), userInfo: searchText, repeats: false)
    }
}
