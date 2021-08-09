//
//  CalculatorView.swift
//  VIES
//
//  Created by Master Family on 07/08/2021.
//
extension String {
    var containsOnlyDigits: Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
    }
}

import SwiftUI


struct CalculatorView: View {
    static let tag: String? = "Calculator"
    @State private var amount = "0"
    var operations = ["Minus VAT", "Plus VAT"]
    @State private var selectedOperation = "Minus VAT"
    @State private var selectedRate: Double = 0
    @State private var net: Double = 0
    @State private var VAT: Double = 0
    @State private var rate: Double = 0
    @Binding var selectedCountry: Country
    var countries: [Country]
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("", text: $amount)
                            .disableAutocorrection(true)
                            .keyboardType(.decimalPad)
                            .font(Font.title.weight(.bold))
                    }
                }
                
                Picker("Member State", selection: $selectedCountry) {
                    SearchBar(text: $searchText)
                        .padding(.top, 8)
                    ForEach(countries.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.self) { country in
                        Text(country.name)
                    }.onDisappear {
                        selectedRate = 0
                    }
                }
                
                Picker("Rate", selection: $selectedRate) {
                    ForEach(selectedCountry.rates, id: \.self) { rate in
                        Text("\(rate, specifier: "%.f")%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                
                
                Picker("Operation", selection: $selectedOperation) {
                    ForEach(operations, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                
                if selectedOperation == "Minus VAT" && amount.containsOnlyDigits {
                    Text("VAT -\(Double(amount)! - (Double(amount)! / (selectedRate / 100 + 1)), specifier: "%.2f")")
                    Text("Net \((Double(amount)! / (selectedRate / 100 + 1)), specifier: "%.2f")")
                } else if selectedOperation == "Plus VAT" && amount.containsOnlyDigits {
                    Text("VAT +\(Double(amount)! * (selectedRate / 100), specifier: "%.2f")")
                    Text("Net \(Double(amount)! + (Double(amount)! * (selectedRate / 100)), specifier: "%.2f")")
                }
                
                
                
            }
            .navigationBarTitle("VAT Calculator")
        }
    }
}
