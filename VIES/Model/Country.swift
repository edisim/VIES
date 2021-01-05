//
//  Country.swift
//  VIES
//
//  Created by Master Family on 04/01/2021.
//

import Foundation

struct Country: Hashable {
    let name: String
    let countryCode: String
    let standardRate: Double
    let reducedRate: [Double]
    let superReducedRate: Double
    let parkingRate: Double
}

// MARK: - Country List
extension Country {
    static let all: [Country] = [
        austria,
        belgium,
        bulgaria,
        cyprus,
        czechia,
        germany,
        denmark,
        estonia,
        greece,
        spain,
        finland,
        france,
        croatia,
        hungary,
        ireland,
        italy,
        lithuania,
        luxembourg,
        latvia,
        malta,
        netherlands,
        poland,
        portugal,
        romania,
        sweden,
        slovenia,
        slovakia
        
    ]
    
    static let austria = Country(name: "Austria 🇦🇹",
                                 countryCode: "AT",
                                 standardRate: 20,
                                 reducedRate: [10, 13],
                                 superReducedRate: 0,
                                 parkingRate: 13)
    
    static let belgium = Country(name: "Belgium 🇧🇪",
                                 countryCode: "BE",
                                 standardRate: 21,
                                 reducedRate: [6, 12],
                                 superReducedRate: 0,
                                 parkingRate: 12)
    
    static let bulgaria = Country(name: "Bulgaria 🇧🇬",
                                  countryCode: "BG",
                                  standardRate: 20,
                                  reducedRate: [9],
                                  superReducedRate: 0,
                                  parkingRate: 0)
    
    static let cyprus = Country(name: "Cyprus 🇨🇾",
                                countryCode: "CY",
                                standardRate: 19,
                                reducedRate: [5, 9],
                                superReducedRate: 0,
                                parkingRate: 0)
    
    static let czechia = Country(name: "Czechia 🇨🇿",
                                 countryCode: "CZ",
                                 standardRate: 21,
                                 reducedRate: [10, 15],
                                 superReducedRate: 0,
                                 parkingRate: 0)
    
    static let germany = Country(name: "Germany 🇩🇪",
                                 countryCode: "DE",
                                 standardRate: 16,
                                 reducedRate: [5],
                                 superReducedRate: 0,
                                 parkingRate: 0)
    
    static let denmark = Country(name: "Denmark 🇩🇰",
                                 countryCode: "DK",
                                 standardRate: 25,
                                 reducedRate: [0],
                                 superReducedRate: 0,
                                 parkingRate: 0)
    
    static let estonia = Country(name: "Estonia 🇪🇪",
                                 countryCode: "EE",
                                 standardRate: 20,
                                 reducedRate: [9],
                                 superReducedRate: 0,
                                 parkingRate: 0)
    
    static let greece = Country(name: "Greece 🇬🇷",
                                countryCode: "EL",
                                standardRate: 24,
                                reducedRate: [6, 13],
                                superReducedRate: 0,
                                parkingRate: 0)
    
    static let spain = Country(name: "Spain 🇪🇸",
                               countryCode: "ES",
                               standardRate: 21,
                               reducedRate: [10],
                               superReducedRate: 4,
                               parkingRate: 0)
    
    static let finland = Country(name: "Finland 🇫🇮",
                                 countryCode: "FI",
                                 standardRate: 24,
                                 reducedRate: [10, 14],
                                 superReducedRate: 0,
                                 parkingRate: 0)
    
    static let france = Country(name: "France 🇫🇷",
                                countryCode: "FR",
                                standardRate: 20,
                                reducedRate: [5.5, 10],
                                superReducedRate: 2.1,
                                parkingRate: 0)
    
    static let croatia = Country(name: "Croatia 🇭🇷",
                                 countryCode: "HR",
                                 standardRate: 25,
                                 reducedRate: [5, 13],
                                 superReducedRate: 0,
                                 parkingRate: 0)
    
    static let hungary = Country(name: "Hungary 🇭🇺",
                                 countryCode: "HU",
                                 standardRate: 27,
                                 reducedRate: [5, 18],
                                 superReducedRate: 0,
                                 parkingRate: 0)
    
    static let ireland = Country(name: "Ireland 🇮🇪",
                                 countryCode: "IE",
                                 standardRate: 23,
                                 reducedRate: [9, 13.5],
                                 superReducedRate: 4.8,
                                 parkingRate: 13.5)
    
    static let italy = Country(name: "Italy 🇮🇹",
                               countryCode: "IT",
                               standardRate: 22,
                               reducedRate: [5, 10],
                               superReducedRate: 4,
                               parkingRate: 0)
    
    static let lithuania = Country(name: "Lithuania 🇱🇹",
                                   countryCode: "LT",
                                   standardRate: 21,
                                   reducedRate: [5, 9],
                                   superReducedRate: 0,
                                   parkingRate: 0)
    
    static let luxembourg = Country(name: "Luxembourg 🇱🇺",
                                    countryCode: "LU",
                                    standardRate: 17,
                                    reducedRate: [8],
                                    superReducedRate: 3,
                                    parkingRate: 14)
    
    static let latvia = Country(name: "Latvia 🇱🇻",
                                countryCode: "LV",
                                standardRate: 21,
                                reducedRate: [12, 5],
                                superReducedRate: 0,
                                parkingRate: 0)
    
    static let malta = Country(name: "Malta 🇲🇹",
                               countryCode: "MT",
                               standardRate: 18,
                               reducedRate: [5, 7],
                               superReducedRate: 0,
                               parkingRate: 0)
    
    static let netherlands = Country(name: "Netherlands 🇳🇱",
                                     countryCode: "NL",
                                     standardRate: 21,
                                     reducedRate: [9],
                                     superReducedRate: 0,
                                     parkingRate: 0)
    
    static let poland = Country(name: "Poland 🇵🇱",
                                countryCode: "PL",
                                standardRate: 23,
                                reducedRate: [5, 8],
                                superReducedRate: 0,
                                parkingRate: 0)
    
    static let portugal = Country(name: "Portugal 🇵🇹",
                                  countryCode: "PT",
                                  standardRate: 23,
                                  reducedRate: [6, 13],
                                  superReducedRate: 0,
                                  parkingRate: 13)
    
    static let romania = Country(name: "Romania 🇷🇴",
                                 countryCode: "RO",
                                 standardRate: 19,
                                 reducedRate: [5, 9],
                                 superReducedRate: 0,
                                 parkingRate: 0)
    
    static let sweden = Country(name: "Sweden 🇸🇪",
                                countryCode: "SE",
                                standardRate: 25,
                                reducedRate: [6, 12],
                                superReducedRate: 0,
                                parkingRate: 0)
    
    static let slovenia = Country(name: "Slovenia 🇸🇮",
                                  countryCode: "SI",
                                  standardRate: 22,
                                  reducedRate: [9.5],
                                  superReducedRate: 0,
                                  parkingRate: 0)
    
    static let slovakia = Country(name: "Slovakia 🇸🇰",
                                  countryCode: "SK",
                                  standardRate: 20,
                                  reducedRate: [10],
                                  superReducedRate: 0,
                                  parkingRate: 0)
    
    
}
