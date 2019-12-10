//
//  CountryData.swift
//  ConcurrencyLab
//
//  Created by Matthew Ramos on 12/9/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import Foundation

struct Country: Decodable {
    let name: String
    let capital: String
    let population: Int
    let flag: String
    let currencies: Currency
    
}

struct Currency: Decodable {
    let code: String
    let name: String
    let symbol: String
}
