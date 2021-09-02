import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {

    init(isForPreview: Bool = false) {
        print("initialising CalculatorViewModel")
        if !isForPreview {
            // Get my data and set to my items array
        }
    }
    
    @Published var amount: Double = UserDefaults.standard.double(forKey: "amount") {
        didSet {
            UserDefaults.standard.setValue(amount, forKey: "amount")
            print("setting amount - \(amount) - UserDefaults")
        }
    }
    @Published var selectedOperation: String = UserDefaults.standard.string(forKey: "selectedOperation") ?? "Minus VAT" {
        didSet {
            UserDefaults.standard.setValue(selectedOperation, forKey: "selectedOperation")
            print("setting selectedOperation - \(selectedOperation) - UserDefaults")
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
