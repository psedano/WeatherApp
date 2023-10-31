//
//  DetailViewController.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 30/10/23.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDegLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var imageIcon: UIImageView!
    
    var weatherDetails: SearchResultModel!
    
    var presenter: WeatherDetailsPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = WeatherDetailsPresenter(view: self)
        setupViews()
        retrieveInformation()
    }
    
    private func setupViews() {
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = UIColor(red: 255.0/255,
                                                green: 255.0/255,
                                                blue: 255.0/255, alpha: 0.2)
    }
    
    private func retrieveInformation() {
        cityNameLabel.text = weatherDetails.name
        
        presenter?.retrieveWeatherDetails(latitude: weatherDetails.lat,
                                          longitude: weatherDetails.lon)
    }
}

extension DetailViewController: WeatherDetailsViewable {
    func setupWeatherImage(image: UIImage) {
        imageIcon.image = image
    }
    
    func setupTextFields(model: WeatherDetails) {
        temperatureLabel.text = "\(model.main.temp.toFarenheit()) F"
        feelsLikeLabel.text = "\(model.main.feels_like.toFarenheit()) F"
        minTempLabel.text = "\(model.main.temp_min.toFarenheit()) F"
        maxTempLabel.text = "\(model.main.temp_max.toFarenheit()) F"
        pressureLabel.text = "\(model.main.pressure) hPa"
        humidityLabel.text = "\(model.main.humidity) %"
        visibilityLabel.text = "\(model.visibility) m"
        windSpeedLabel.text = "\(model.wind.speed) m/sec"
        windDegLabel.text = "\(model.wind.deg)"
    }
}
