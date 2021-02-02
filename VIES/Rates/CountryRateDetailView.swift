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
                ForEach(country.rates.keys.sorted().reversed(), id:\.self) { key in
                    HStack {
                        Text("\(key):")
                        ForEach(country.rates[key]!, id:\.self) { value in
                            Text("\(value, specifier: "%.2f")")
                        }
                    }
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
