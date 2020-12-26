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
    @State private var grossAmount = ""
    @State private var rate = 0.0
    @State private var VAT = ""
    @State private var netAmount = ""
    var body: some View {
        NavigationView {
        Form {
            TextField("Gross Amount", text: $grossAmount)
            Slider(value: $rate, in: 0...50, step: 1)
            Text("VAT Rate \(rate, specifier: "%.f")%")
            Button(action: {calculate(rate: rate)}) {
                Text("Calculate")
            }.disabled(!grossAmount.containsOnlyDigits)
            Text("VAT Amount \(VAT)")
            Text("Net Amount \(netAmount)")
        }.navigationBarTitle("VAT Calculator")
        }
    }
    func calculate(rate: Double){
        
        VAT = String(Double(grossAmount)! * Double((rate)/100))
        netAmount = String(Double(grossAmount)! - Double(VAT)!)
        
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
