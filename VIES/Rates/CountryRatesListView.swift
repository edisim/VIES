//
//  CountriesListView.swift
//  VIES
//
//  Created by Master Family on 04/01/2021.
//

import SwiftUI

struct CountryRatesListView: View {
    static let tag: String? = "Rates"
    var countries: [String]
    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.self) { country in
                    NavigationLink(destination: CountryRateDetailView(country: country)) {
                Text("\(country)")
                }
            }
            }
            .navigationBarTitle("VAT Rates")
        }
    }
}

struct CountryRatesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRatesListView(countries: ["Austria 🇦🇹", "Belgium 🇧🇪", "Bulgaria 🇧🇬", "Croatia 🇭🇷", "Cyprus 🇨🇾", "Czechia 🇨🇿", "Denmark 🇩🇰", "Estonia 🇪🇪", "Finland 🇫🇮", "France 🇫🇷", "Germany 🇩🇪", "Greece 🇬🇷", "Hungary 🇭🇺", "Ireland 🇮🇪", "Italy 🇮🇹", "Latvia 🇱🇻", "Lithuania 🇱🇹", "Luxembourg 🇱🇺", "Malta 🇲🇹", "Netherlands 🇳🇱", "Poland 🇵🇱", "Portugal 🇵🇹", "Romania 🇷🇴", "Slovakia 🇸🇰", "Slovenia 🇸🇮", "Spain 🇪🇸", "Sweden 🇸🇪"])
    }
}
