import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {

    
    @Published var amount: Double = UserDefaults.standard.double(forKey: "amount") {
        didSet {
            settings.setValue(amount, forKey: "amount")
        }
    }
    @Published var selectedOperation: String = UserDefaults.standard.string(forKey: "selectedOperation") ?? "Minus VAT" {
        didSet {
            settings.setValue(selectedOperation, forKey: "selectedOperation")
        }
    }

    @Published var net: Double = 0
    @Published var VAT: Double = 0
    
    func calculate(rate: Double) {
        if selectedOperation == "Minus VAT" {
            VAT = amount - (amount / (rate / 100 + 1))
            net = amount / (rate / 100 + 1)
            
        } else if selectedOperation == "Plus VAT" {
            VAT = amount * (rate / 100)
            net = amount + (amount * (rate / 100))
        }
    }
}
