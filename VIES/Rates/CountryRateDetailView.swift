//
//  CountryRateDetailView.swift
//  VIES
//
//  Created by Master Family on 04/01/2021.
//

import SwiftUI

struct CountryRateDetailView: View {
    var country: Country
    var body: some View {
        VStack(alignment: .leading) {
            Text(country.name)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.leading)
            Group {
            HStack {
                Text("Country Code:")
            Text("\(country.countryCode)")
                .fontWeight(.bold)
            }
            HStack {
                Text("Standard Rate:")
            Text("\(country.rates[0][0], specifier: "%.2f")")
                .fontWeight(.bold)
            }
            HStack {
                Text("Reduced Rate:")
//                ForEach(country.rates[1]) { value in
//                Text("\(value, specifier: "%.2f")")
//                    .fontWeight(.bold)
//            }
            }
            HStack {
                Text("Super Reduced Rate:")
            Text("\(country.rates[2][0], specifier: "%.2f")")
                .fontWeight(.bold)
            }
            HStack {
                Text("Parking Rate:")
            Text("\(country.rates[3][0], specifier: "%.2f")")
                .fontWeight(.bold)
            }
            }.font(.body)
            .padding(.leading)

            MapView(country: country)
        }
    }
}

struct CountryRateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRateDetailView(country: Country.austria)
    }
}
