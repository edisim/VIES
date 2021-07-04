//
//  ContentView.swift
//  VIES
//
//  Created by Master Family on 17/12/2020.
//

import SwiftUI

struct ContentView: View {

    @AppStorage("selectedView") var selectedView: String?
    var validCharacters = NSCharacterSet.capitalizedLetters
    @State private var selectedCountry = Country.austria
    //TODO: User can save his VAT number so he does not need to enter it every time (USERDEFAULTS)
    var countries = Country.all
    var body: some View {
        TabView(selection: $selectedView) {
            ValidationView(selectedCountry: $selectedCountry, countries: countries)
                .onAppear {
                    AppReviewRequest.requestReviewIfNeeded()
                }
                .tag(ValidationView.tag)
                .tabItem { Label("Validation", systemImage: "checkmark") }

//            CalculatorView(selectedCountry: $selectedCountry, countries: countries)
//                .tag(CalculatorView.tag)
//                .tabItem { Label("Calculator", systemImage: "percent") }

            CountryRatesListView(countries: countries)
                .tag(CountryRatesListView.tag)
                .tabItem { Label("Rates", systemImage: "info") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
