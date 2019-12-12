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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error: Check prepare for segue")
        }
        detailVC.country = countries[indexPath.row]
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

