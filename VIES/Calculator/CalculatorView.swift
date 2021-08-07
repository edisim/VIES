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
    @State private var amount = ""
    var operations = ["Minus VAT", "Plus VAT"]
    @State private var selectedOperation = "Minus VAT"
    @State private var net: Double = 0
    @State private var VAT: Double = 0
    @State private var rate: Double = 0
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Text("Amount:")
                    TextField("", text: $amount)
                }
                Picker("Operation", selection: $selectedOperation) {
                    ForEach(operations, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())

                Slider(value: $rate, in: 0...50)
                Text("Rate: \(rate, specifier: "%.f")%")

                Text("VAT: \(VAT, specifier: "%.2f")")
                Text("Net: \(net, specifier: "%.2f")")

            }
            .navigationBarTitle("VAT Calculator")
            .navigationBarItems(trailing:
                                    Button(action: {calculate(amount: Double(amount)!)}) {
                                        Text("Calculate")
                                    }.disabled(!amount.containsOnlyDigits || amount.isEmpty)
            )
        }
    }

    func calculate(amount: Double) {
        if selectedOperation == "Minus VAT" {
            VAT = amount - (amount / (Double(rate) / 100 + 1))
            net = (amount / (Double(rate) / 100 + 1))
        } else if selectedOperation == "Plus VAT" {
            VAT = amount * (Double(rate) / 100)
            net = amount + (amount * (Double(rate) / 100))
        }

    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
