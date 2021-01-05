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
        VStack {
            Text(country.name)
            Text(country.countryCode)
            Text("\(country.standardRate)")
            ForEach(country.reducedRate, id: \.self) { value in
                Text("\(value)")
            }
            Text("\(country.superReducedRate)")
            Text("\(country.parkingRate)")
        }
    }
}

struct CountryRateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRateDetailView(country: Country.austria)
    }
}
