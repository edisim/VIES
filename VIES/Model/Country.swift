//
//  Country.swift
//  VIES
//
//  Created by Master Family on 04/01/2021.
//

import Foundation

struct Country {
    var name: String
    var countryCode: String
    var standardRate: Double
    var reducedRate: [Double]
    var superReducedRate: Double
    var parkingRate: Double
}

// MARK: - Country List
extension Country {
    static let all: [Country] = [
        .austria
    ]

    static let austria = Country(name: "Austria",
                                 countryCode: "AT",
                                 standardRate: 20,
                                 reducedRate: [10, 13],
                                 superReducedRate: 0,
                                 parkingRate: 13)

    static let belgium = Country(name: "Belgium",
                                 countryCode: "BE",
                                 standardRate: 21,
                                 reducedRate: [6, 12],
                                 superReducedRate: 0,
                                 parkingRate: 12)
    

   // COuntinue

}
