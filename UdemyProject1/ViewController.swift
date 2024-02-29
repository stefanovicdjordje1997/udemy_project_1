//
//  ViewController.swift
//  UdemyProject1
//
//  Created by Djordje Stefanovic on 29.2.24..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var cities: [String: String] = ["Belgrade": "Serbia", "Amsterdam": "Netherlands", "Budapest": "Hungary", "Paris": "France", "Minhen": "Germany", "Bejing": "China", "Moscow": "Russia"]
    
    var cityNames: [String] = []
    let cellIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNames = Array(cities.keys)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        var cellContentConfiguration = cell.defaultContentConfiguration()
        let cityName = cityNames[indexPath.row]
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = cities[cityName]
        cell.contentConfiguration = cellContentConfiguration
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityName = cityNames[indexPath.row]
        print("City: \(cityName)\t Country: \(cities[cityName] ?? "")")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

