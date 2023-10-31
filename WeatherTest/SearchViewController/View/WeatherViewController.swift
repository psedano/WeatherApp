//
//  ViewController.swift
//  WeatherTest
//
//  Created by Pablo Irmin Rivera Sedano on 20/10/23.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var weatherArray: [SearchResultModel] = []
    var weatherPresenter: WeatherPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherPresenter = WeatherPresenter(view: self)
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
}

extension WeatherViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        weatherPresenter?.cleanAndStartTimer(searchText: searchText)
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = weatherArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailVC", sender: weatherArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        let weatherDetails = sender as! SearchResultModel
        detailVC.weatherDetails = weatherDetails
    }
}

// Extension from passing information from Presenter -> View
extension WeatherViewController: WeatherViewable {
    func reloadTableData() {
        self.tableView.reloadData()
    }
    
    func getWeatherArray(model: [SearchResultModel]) {
        self.weatherArray = model
    }
    
    func cleanArray() {
        weatherArray.removeAll()
    }
}

