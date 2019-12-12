//
//  DetailViewController.swift
//  ConcurrencyLab
//
//  Created by Matthew Ramos on 12/12/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let detailVCCountry = country else {
            fatalError("Couldn't pull Country, check prepare for segue")
        }
        countryNameLabel.text = detailVCCountry.name
        capitalLabel.text = detailVCCountry.capital
        populationLabel.text = "Population: " + detailVCCountry.populationFormatter()
    
    }
}
