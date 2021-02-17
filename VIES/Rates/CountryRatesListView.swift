//
//  CountriesListView.swift
//  VIES
//
//  Created by Master Family on 04/01/2021.
//

import SwiftUI

struct CountryRatesListView: View {
    static let tag: String? = "Rates"
    @State private var searchText = ""
    var countries: [Country]
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.top, 8)
                List {
                    ForEach(countries.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.self) { country in
                        NavigationLink(destination: CountryRateDetailView(country: country)) {
                            Text(country.name)
                        }
                    }
                }.listStyle(PlainListStyle())
                .navigationBarTitle("VAT Rates")
            }
        }
    }
}

struct CountryRatesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRatesListView(countries: Country.all)
    }
}
