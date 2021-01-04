//
//  CountryRateDetailView.swift
//  VIES
//
//  Created by Master Family on 04/01/2021.
//

import SwiftUI

struct CountryRateDetailView: View {
    var country: String
    var body: some View {
        Text(country)
    }
}

struct CountryRateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRateDetailView(country: "Croatia 🇭🇷")
    }
}
