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
    
    var countries = [Country]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    let data = Bundle.readJSONData(filename: "countryData", ext: "json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = Country.getCountries(data)
        tableView.dataSource = self
        searchBar.delegate = self
        
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

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            print("Missing search text")
            return
        }
        countries = Country.getCountries(data)
        countries = countries.filter { ($0.name.lowercased() + $0.capital.lowercased()).contains(searchText.lowercased())}
    }
}

