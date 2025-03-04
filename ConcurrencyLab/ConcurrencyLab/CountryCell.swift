//
//  CountryCell.swift
//  ConcurrencyLab
//
//  Created by Matthew Ramos on 12/11/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var flagView: UIImageView!
    
    func configureCell (_ country: Country){
        
        countryNameLabel.text = country.name
        capitalLabel.text = country.capital
        populationLabel.text = "Population: " + country.populationFormatter()
    
        flagView.getImage(with: country.flagURL) { [weak self] result in
            switch result {
            case .failure:
                (self?.flagView.image = UIImage(systemName: "xmark.icloud"))
            case .success(let image):
                DispatchQueue.main.async {
                    self?.flagView.image = image
                }
            }
        }
    }
}
