//
//  CalculatorView.swift
//  VIES
//
//  Created by Master Family on 26/12/2020.
//

import SwiftUI

extension String {
    var containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
    }
}

struct CalculatorView: View {
    static let tag: String? = "Calculator"
    
    @State private var grossAmount = ""
    @State private var VAT = 0.0
    @State private var netAmount = 0.0
    
    @State private var selectedCountry = Country.austria
    var countries: [Country]
    
    @State private var selectedRate = 0
    var rates = ["Standard rate", "Reduced rate", "Super reduced rate", "Parking rate"]
    
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selectedCountry, label: Text("Member State")) {
                    ForEach(countries, id: \.self) { country in
                        Text(country.name)
                    }
                }
                TextField("Gross Amount", text: $grossAmount)
                    .keyboardType(.numberPad)
                    .onTapGesture {
                        isEditing = true
                    }
                // Slider(value: $rate, in: 0...50, step: 1)
                Text("Standard \(selectedCountry.name) VAT Rate \(selectedCountry.standardRate, specifier: "%.f")%")
                Picker(selection: $selectedRate, label: Text("Rate type")) {
                    ForEach(0 ..< rates.count) {
                        Text(self.rates[$0])
                    }
                }
                Text("VAT Amount \(VAT, specifier: "%.2f")")
                Text("Net Amount \(netAmount, specifier: "%.2f")")
            }.navigationBarTitle("VAT Calculator")
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.hideKeyboard()
                                        self.isEditing = false
                                    }) {
                                        Text("Done")
                                    }.disabled(!isEditing),
                                trailing:
                                    Button(action: {calculate(standardRate: selectedCountry.standardRate, reducedRate: selectedCountry.reducedRate, superReducedRate: selectedCountry.superReducedRate, parkingRate: selectedCountry.parkingRate)}) {
                                        Text("Calculate")
                                    }.disabled(!grossAmount.containsOnlyDigits || grossAmount.isEmpty)
            )
            
        }
        
    }
    
    func calculate(standardRate: Double, reducedRate: [Double], superReducedRate: Double, parkingRate: Double) {
        
        self.hideKeyboard()
        self.isEditing = false
        
        VAT = Double(grossAmount)! * (standardRate/100)
        netAmount = Double(grossAmount)! - VAT
        
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(countries: Country.all)
    }
}
