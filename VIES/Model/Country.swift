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
    let rates: [[Double]]
//    let standardRate: Double
//    let reducedRate: [Double]
//    let superReducedRate: Double
//    let parkingRate: Double
    let capital: Capital
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
// [[Standard], [Reduced], [Super], [Parking]]
    static let austria = Country(name: "Austria 🇦🇹",
                                 countryCode: "AT",
                                 rates: [[20], [10, 13], [0], [13]],
//                                 standardRate: 20,
//                                 reducedRate: [10, 13],
//                                 superReducedRate: 0,
//                                 parkingRate: 13,
                                 capital: .vienna)

    static let belgium = Country(name: "Belgium 🇧🇪",
                                 countryCode: "BE",
                                 rates: [[21], [6, 12], [0], [12]],
//                                 standardRate: 21,
//                                 reducedRate: [6, 12],
//                                 superReducedRate: 0,
//                                 parkingRate: 12,
                                 capital: .brussels)

    static let bulgaria = Country(name: "Bulgaria 🇧🇬",
                                  countryCode: "BG",
                                  rates: [[20], [9], [0], [0]],
//                                  standardRate: 20,
//                                  reducedRate: [9],
//                                  superReducedRate: 0,
//                                  parkingRate: 0,
                                  capital: .sofia)

    static let cyprus = Country(name: "Cyprus 🇨🇾",
                                countryCode: "CY",
                                rates: [[19], [5, 9], [0], [0]],
//                                standardRate: 19,
//                                reducedRate: [5, 9],
//                                superReducedRate: 0,
//                                parkingRate: 0,
                                capital: .nicosia)

    static let czechia = Country(name: "Czechia 🇨🇿",
                                 countryCode: "CZ",
                                 rates: [[21], [10, 15], [0], [0]],
//                                 standardRate: 21,
//                                 reducedRate: [10, 15],
//                                 superReducedRate: 0,
//                                 parkingRate: 0,
                                 capital: .prague)

    static let germany = Country(name: "Germany 🇩🇪",
                                 countryCode: "DE",
                                 rates: [[16], [5], [0], [0]],
//                                 standardRate: 16,
//                                 reducedRate: [5],
//                                 superReducedRate: 0,
//                                 parkingRate: 0,
                                 capital: .berlin)

    static let denmark = Country(name: "Denmark 🇩🇰",
                                 countryCode: "DK",
                                 rates: [[25], [0], [0], [0]],
//                                 standardRate: 25,
//                                 reducedRate: [0],
//                                 superReducedRate: 0,
//                                 parkingRate: 0,
                                 capital: .copenhagen)

    static let estonia = Country(name: "Estonia 🇪🇪",
                                 countryCode: "EE",
                                 rates: [[20], [9], [0], [0]],
//                                 standardRate: 20,
//                                 reducedRate: [9],
//                                 superReducedRate: 0,
//                                 parkingRate: 0,
                                 capital: .tallinn)

    static let greece = Country(name: "Greece 🇬🇷",
                                countryCode: "EL",
                                rates: [[24], [6, 13], [0], [0]],
//                                standardRate: 24,
//                                reducedRate: [6, 13],
//                                superReducedRate: 0,
//                                parkingRate: 0,
                                capital: .athens)

    static let spain = Country(name: "Spain 🇪🇸",
                               countryCode: "ES",
                               rates: [[21], [10], [4], [0]],
//                               standardRate: 21,
//                               reducedRate: [10],
//                               superReducedRate: 4,
//                               parkingRate: 0,
                               capital: .madrid)

    static let finland = Country(name: "Finland 🇫🇮",
                                 countryCode: "FI",
                                 rates: [[24], [10, 14], [0], [0]],
//                                 standardRate: 24,
//                                 reducedRate: [10, 14],
//                                 superReducedRate: 0,
//                                 parkingRate: 0,
                                 capital: .helsinki)

    static let france = Country(name: "France 🇫🇷",
                                countryCode: "FR",
                                rates: [[20], [5.5, 10], [2.1], [0]],
//                                standardRate: 20,
//                                reducedRate: [5.5, 10],
//                                superReducedRate: 2.1,
//                                parkingRate: 0,
                                capital: .paris)

    static let croatia = Country(name: "Croatia 🇭🇷",
                                 countryCode: "HR",
                                 rates: [[25], [5, 13], [0], [0]],
//                                 standardRate: 25,
//                                 reducedRate: [5, 13],
//                                 superReducedRate: 0,
//                                 parkingRate: 0,
                                 capital: .zagreb)

    static let hungary = Country(name: "Hungary 🇭🇺",
                                 countryCode: "HU",
                                 rates: [[27], [5, 18], [0], [0]],
//                                 standardRate: 27,
//                                 reducedRate: [5, 18],
//                                 superReducedRate: 0,
//                                 parkingRate: 0,
                                 capital: .budapest)

    static let ireland = Country(name: "Ireland 🇮🇪",
                                 countryCode: "IE",
                                 rates: [[23], [9, 13.5], [4.8], [13.5]],
//                                 standardRate: 23,
//                                 reducedRate: [9, 13.5],
//                                 superReducedRate: 4.8,
//                                 parkingRate: 13.5,
                                 capital: .dublin)

    static let italy = Country(name: "Italy 🇮🇹",
                               countryCode: "IT",
                               rates: [[22], [5, 10], [4], [0]],
//                               standardRate: 22,
//                               reducedRate: [5, 10],
//                               superReducedRate: 4,
//                               parkingRate: 0,
                               capital: .rome)

    static let lithuania = Country(name: "Lithuania 🇱🇹",
                                   countryCode: "LT",
                                   rates: [[21], [5, 9], [0], [0]],
//                                   standardRate: 21,
//                                   reducedRate: [5, 9],
//                                   superReducedRate: 0,
//                                   parkingRate: 0,
                                   capital: .vilnius)

    static let luxembourg = Country(name: "Luxembourg 🇱🇺",
                                    countryCode: "LU",
                                    rates: [[17], [8], [3], [14]],
//                                    standardRate: 17,
//                                    reducedRate: [8],
//                                    superReducedRate: 3,
//                                    parkingRate: 14,
                                    capital: .luxembourg)

    static let latvia = Country(name: "Latvia 🇱🇻",
                                countryCode: "LV",
                                rates: [[21], [12, 5], [0], [0]],
//                                standardRate: 21,
//                                reducedRate: [12, 5],
//                                superReducedRate: 0,
//                                parkingRate: 0,
                                capital: .riga)

    static let malta = Country(name: "Malta 🇲🇹",
                               countryCode: "MT",
                               rates: [[18], [5, 7], [0], [0]],
//                               standardRate: 18,
//                               reducedRate: [5, 7],
//                               superReducedRate: 0,
//                               parkingRate: 0,
                               capital: .valletta)

    static let netherlands = Country(name: "Netherlands 🇳🇱",
                                     countryCode: "NL",
                                     rates: [[21], [9], [0], [0]],
//                                     standardRate: 21,
//                                     reducedRate: [9],
//                                     superReducedRate: 0,
//                                     parkingRate: 0,
                                     capital: .amsterdam)

    static let poland = Country(name: "Poland 🇵🇱",
                                countryCode: "PL",
                                rates: [[23], [5, 8], [0], [0]],
//                                standardRate: 23,
//                                reducedRate: [5, 8],
//                                superReducedRate: 0,
//                                parkingRate: 0,
                                capital: .warsaw)

    static let portugal = Country(name: "Portugal 🇵🇹",
                                  countryCode: "PT",
                                  rates: [[23], [6, 13], [0], [13]],
//                                  standardRate: 23,
//                                  reducedRate: [6, 13],
//                                  superReducedRate: 0,
//                                  parkingRate: 13,
                                  capital: .lisbon)

    static let romania = Country(name: "Romania 🇷🇴",
                                 countryCode: "RO",
                                 rates: [[19], [5, 9], [0], [0]],
//                                 standardRate: 19,
//                                 reducedRate: [5, 9],
//                                 superReducedRate: 0,
//                                 parkingRate: 0,
                                 capital: .bucharest)

    static let sweden = Country(name: "Sweden 🇸🇪",
                                countryCode: "SE",
                                rates: [[25], [6, 12], [0], [0]],
//                                standardRate: 25,
//                                reducedRate: [6, 12],
//                                superReducedRate: 0,
//                                parkingRate: 0,
                                capital: .stockholm)

    static let slovenia = Country(name: "Slovenia 🇸🇮",
                                  countryCode: "SI",
                                  rates: [[22], [9.5], [0], [0]],
//                                  standardRate: 22,
//                                  reducedRate: [9.5],
//                                  superReducedRate: 0,
//                                  parkingRate: 0,
                                  capital: .ljubljana)

    static let slovakia = Country(name: "Slovakia 🇸🇰",
                                  countryCode: "SK",
                                  rates: [[20], [10], [0], [0]],
//                                  standardRate: 20,
//                                  reducedRate: [10],
//                                  superReducedRate: 0,
//                                  parkingRate: 0,
                                  capital: .bratislava)

}
