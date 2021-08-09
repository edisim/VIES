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
                Text("Standard rate: \(country.standardRate, specifier: "%.f")%")
                if country.reducedRate[0] != 0 {
                    HStack {
                        Text("Reduced rate: ")
                        ForEach(country.reducedRate, id: \.self) { rate in
                            Text("\(rate, specifier: "%.f")%")
                        }
                    }
                }
                if country.superReducedRate != 0 {
                    Text("Super reduced rate: \(country.superReducedRate, specifier: "%.f")%")
                }
                if country.parkingRate != 0 {
                    Text("Parking rate: \(country.parkingRate, specifier: "%.f")%")
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
