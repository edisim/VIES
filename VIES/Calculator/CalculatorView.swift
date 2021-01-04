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
    @State private var rate = 0.0
    @State private var VAT = 0.0
    @State private var netAmount = 0.0
    var body: some View {
        NavigationView {
        Form {
            TextField("Gross Amount", text: $grossAmount)
            Slider(value: $rate, in: 0...50, step: 1)
            Text("VAT Rate \(rate, specifier: "%.f")%")
            Button(action: {calculate(rate: rate)}) {
                Text("Calculate")
            }.disabled(!grossAmount.containsOnlyDigits || grossAmount.isEmpty)
            Text("VAT Amount \(VAT, specifier: "%.2f")")
            Text("Net Amount \(netAmount, specifier: "%.2f")")
        }.navigationBarTitle("VAT Calculator")
        }
    }
    func calculate(rate: Double) {

        VAT = Double(grossAmount)! * (rate/100)
        netAmount = Double(grossAmount)! - VAT

    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
