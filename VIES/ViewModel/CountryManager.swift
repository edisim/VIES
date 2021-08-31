import Foundation

class CountryManager: ObservableObject {
    
    init(isForPreview: Bool = false) {
        print("initialising CountryManager")
        if !isForPreview {
            // Get my data and set to my items array
        }
    }
    
    @Published var selectedCountryIndex: Int = UserDefaults.standard.optionalInt(forKey: "selectedCountryIndex") ?? 0 {
        didSet {
            settings.set(selectedCountryIndex, forKey: "selectedCountryIndex")
            print("selectedCountryIndex - \(selectedCountryIndex)")
        }
    }
    
    @Published var selectedRateIndex: Int = UserDefaults.standard.optionalInt(forKey: "selectedRateIndex") ?? 0 {
        didSet {
            settings.set(selectedRateIndex, forKey: "selectedRateIndex")
            print("selectedRateIndex - \(selectedRateIndex)")
        }
    }
    
    @Published var allCountries: [Country] = [
        //        0
        Country(name: "Austria 🇦🇹",
                countryCode: "AT",
                standardRate: 20,
                reducedRate: [10, 13],
                superReducedRate: 0,
                parkingRate: 13,
                rates: [10, 13, 20],
                capital: .vienna),
        //        1
        Country(name: "Belgium 🇧🇪",
                countryCode: "BE",
                standardRate: 21,
                reducedRate: [6, 12],
                superReducedRate: 0,
                parkingRate: 12,
                rates: [6, 12, 21],
                capital: .brussels),
        //        2
        Country(name: "Bulgaria 🇧🇬",
                countryCode: "BG",
                standardRate: 20,
                reducedRate: [9],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [9, 20],
                capital: .sofia),
        //        3
        Country(name: "Cyprus 🇨🇾",
                countryCode: "CY",
                standardRate: 19,
                reducedRate: [5, 9],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [5, 9, 19],
                capital: .nicosia),
        //        4
        Country(name: "Czechia 🇨🇿",
                countryCode: "CZ",
                standardRate: 21,
                reducedRate: [10, 15],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [10, 15, 21],
                capital: .prague),
        //        5
        Country(name: "Germany 🇩🇪",
                countryCode: "DE",
                standardRate: 19,
                reducedRate: [7],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [7, 19],
                capital: .berlin),
        //        6
        Country(name: "Denmark 🇩🇰",
                countryCode: "DK",
                standardRate: 25,
                reducedRate: [0],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [25],
                capital: .copenhagen),
        //        7
        Country(name: "Estonia 🇪🇪",
                countryCode: "EE",
                standardRate: 20,
                reducedRate: [9],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [9, 20],
                capital: .tallinn),
        //        8
        Country(name: "Greece 🇬🇷",
                countryCode: "EL",
                standardRate: 24,
                reducedRate: [6, 13],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [6, 13, 24],
                capital: .athens),
        //        9
        Country(name: "Spain 🇪🇸",
                countryCode: "ES",
                standardRate: 21,
                reducedRate: [10],
                superReducedRate: 4,
                parkingRate: 0,
                rates: [4, 10, 21],
                capital: .madrid),
        //        10
        Country(name: "Finland 🇫🇮",
                countryCode: "FI",
                standardRate: 24,
                reducedRate: [10, 14],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [10, 14, 24],
                capital: .helsinki),
        //        11
        Country(name: "France 🇫🇷",
                countryCode: "FR",
                standardRate: 20,
                reducedRate: [5.5, 10],
                superReducedRate: 2.1,
                parkingRate: 0,
                rates: [2.1, 5.5, 10, 20],
                capital: .paris),
        //        12
        Country(name: "Croatia 🇭🇷",
                countryCode: "HR",
                standardRate: 25,
                reducedRate: [5, 13],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [5, 13, 25],
                capital: .zagreb),
        //        13
        Country(name: "Hungary 🇭🇺",
                countryCode: "HU",
                standardRate: 27,
                reducedRate: [5, 18],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [5, 18, 27],
                capital: .budapest),
        //        14
        Country(name: "Ireland 🇮🇪",
                countryCode: "IE",
                standardRate: 23,
                reducedRate: [9, 13.5],
                superReducedRate: 4.8,
                parkingRate: 13.5,
                rates: [4.8, 9, 13.5, 23],
                capital: .dublin),
        //        15
        Country(name: "Italy 🇮🇹",
                countryCode: "IT",
                standardRate: 22,
                reducedRate: [5, 10],
                superReducedRate: 4,
                parkingRate: 0,
                rates: [4, 5, 10, 22],
                capital: .rome),
        //        16
        Country(name: "Lithuania 🇱🇹",
                countryCode: "LT",
                standardRate: 21,
                reducedRate: [5, 9],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [5, 9, 21],
                capital: .vilnius),
        //        17
        Country(name: "Luxembourg 🇱🇺",
                countryCode: "LU",
                standardRate: 17,
                reducedRate: [8],
                superReducedRate: 3,
                parkingRate: 14,
                rates: [3, 8, 14, 17],
                capital: .luxembourg),
        //        18
        Country(name: "Latvia 🇱🇻",
                countryCode: "LV",
                standardRate: 21,
                reducedRate: [5, 12],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [5, 12, 21],
                capital: .riga),
        //        19
        Country(name: "Malta 🇲🇹",
                countryCode: "MT",
                standardRate: 18,
                reducedRate: [5, 7],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [5, 7, 18],
                capital: .valletta),
        //        20
        Country(name: "Netherlands 🇳🇱",
                countryCode: "NL",
                standardRate: 21,
                reducedRate: [9],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [9, 21],
                capital: .amsterdam),
        //        21
        Country(name: "Poland 🇵🇱",
                countryCode: "PL",
                standardRate: 23,
                reducedRate: [5, 8],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [5, 8, 23],
                capital: .warsaw),
        //        22
        Country(name: "Portugal 🇵🇹",
                countryCode: "PT",
                standardRate: 23,
                reducedRate: [6, 13],
                superReducedRate: 0,
                parkingRate: 13,
                rates: [6, 13, 23],
                capital: .lisbon),
        //        23
        Country(name: "Romania 🇷🇴",
                countryCode: "RO",
                standardRate: 19,
                reducedRate: [5, 9],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [5, 9, 19],
                capital: .bucharest),
        //        24
        Country(name: "Sweden 🇸🇪",
                countryCode: "SE",
                standardRate: 25,
                reducedRate: [6, 12],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [6, 12, 25],
                capital: .stockholm),
        //        25
        Country(name: "Slovenia 🇸🇮",
                countryCode: "SI",
                standardRate: 22,
                reducedRate: [9.5],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [9.5, 22],
                capital: .ljubljana),
        //        26
        Country(name: "Slovakia 🇸🇰",
                countryCode: "SK",
                standardRate: 20,
                reducedRate: [10],
                superReducedRate: 0,
                parkingRate: 0,
                rates: [10, 20],
                capital: .bratislava)
    ]
    
    
    // MARK: Preview
    
}
