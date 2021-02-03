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
    @State private var searchText = ""
    
    
    @Binding var selectedCountry: Country
    var countries: [Country]
    
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            Form {
                
                // MARK: Country Picker
                Picker(selection: $selectedCountry, label: Text("Member State")) {
                    SearchBar(text: $searchText)
                        .padding(.top, 8)
                    ForEach(countries.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.self) { country in
                        Text(country.name)
                        
                    }
                }.onChange(of: selectedCountry) { newSelectedCountry in
                    //                    calculate(rates: newSelectedCountry.rates, newAmount: grossAmount, newSelectedRate: selectedRate)
                }
                
                // MARK: Rate Type Picker
                
                // MARK: Reduced Rate Picker
                Picker(selection: $selectedCountry.rates["Reduced"], label: Text("Rate type")) {
                    ForEach((selectedCountry.rates["Reduced"]?.sorted()) ?? [0], id:\.self) { value in
                        Text("\(value, specifier: "%.2f")")
                    }
                }.onChange(of: selectedCountry.rates["Reduced"]) { newSelectedRate in
                    print(newSelectedRate ?? [0])
                    //                    calculate(rates: selectedCountry.rates, newAmount: grossAmount, newSelectedRate: selectedRate)
                }
                
                
                
                //                if selectedRate != 1 {
                //                    Text("\(rates[selectedRate]) VAT Rate is \(selectedCountry.rates[selectedRate][0], specifier: "%.f")%")
                //                } else if selectedRate == 1 {
                //                    Picker(selection: $selectedReducedRate, label: Text("Reduced rate")) {
                //                        ForEach(0 ..< selectedCountry.rates[selectedRate].count) { rate in
                //                            Text("\(rate)")
                //                        }
                //                    }
                //                    Text("\(rates[selectedRate]) is \(selectedCountry.rates[selectedRate][0], specifier: "%.f")%")                }
                
                TextField("Gross Amount", text: $grossAmount)
                    .keyboardType(.numberPad)
                    .onTapGesture {
                        isEditing = true
                    }
                    .onChange(of: grossAmount) { newAmount in
                        //                        calculate(rates: selectedCountry.rates, newAmount: newAmount, newSelectedRate: selectedRate)
                    }
                // Slider(value: $rate, in: 0...50, step: 1)
                
                Text("VAT Amount \(VAT, specifier: "%.2f")")
                Text("Net Amount \(netAmount, specifier: "%.2f")")
                
            }.navigationBarTitle("VAT Calculator")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.hideKeyboard()
                                        self.isEditing = false
                                    }) {
                                        Text("Done")
                                    }.disabled(!isEditing)
                                
            )
            
        }
        
    }
    
    func calculate(rates: [[Double]], newAmount: String, newSelectedRate: Int) {
        
        switch newSelectedRate {
        case 0:
            VAT = Double(newAmount)! * (rates[0][0]/100)
            netAmount = Double(newAmount)! - VAT
        case 1:
            VAT = Double(newAmount)! * (rates[1][0]/100)
            netAmount = Double(newAmount)! - VAT
        case 2:
            VAT = Double(newAmount)! * (rates[2][0]/100)
            netAmount = Double(newAmount)! - VAT
        default:
            VAT = Double(newAmount)! * (rates[3][0]/100)
            netAmount = Double(newAmount)! - VAT
        }
        
    }
}
