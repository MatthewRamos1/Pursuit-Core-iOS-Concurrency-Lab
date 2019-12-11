//
//  ViewController.swift
//  ConcurrencyLab
//
//  Created by Matthew Ramos on 12/9/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = Bundle.readJSONData(filename: "countryData", ext: "json")
        countries = Country.getCountries(data)
        tableView.dataSource = self
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell else {
            fatalError("Couldn't access custom cell")
        }
        let country = countries[indexPath.row]
        cell.configureCell(country)
        return cell
    }
    
    
}

