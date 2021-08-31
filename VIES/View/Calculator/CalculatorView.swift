import SwiftUI

struct CalculatorView: View {
    static let tag: String? = "Calculator"
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()
    
    @State private var searchText = ""
    @StateObject var calculatorViewModel = CalculatorViewModel()
    @EnvironmentObject var countryManager: CountryManager
    var operations = ["Minus VAT", "Plus VAT"]
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    #warning("u iOS 15 ces moc dismiss keyboard bez problema")
                    TextField("", value: $calculatorViewModel.amount, formatter: formatter)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                        .font(Font.title.weight(.bold))
                        .padding()
                        .onChange(of: calculatorViewModel.amount, perform: { value in
                            calculatorViewModel.calculate(rate: countryManager.allCountries[countryManager.selectedCountryIndex].rates[countryManager.selectedRateIndex])
                        })
                    
                }
                
                Picker("Member State", selection: $countryManager.selectedCountryIndex) {
                    
                    ForEach(0..<countryManager.allCountries.count, id: \.self) { index in
                        Text(countryManager.allCountries[index].name)
                    }.onDisappear {
                        countryManager.selectedRateIndex = 0
                    }
                }.onChange(of: countryManager.selectedCountryIndex, perform: { value in
                    calculatorViewModel.calculate(rate: countryManager.allCountries[countryManager.selectedCountryIndex].rates[countryManager.selectedRateIndex])
                })
                
                #warning("ovo je malo sjebano!")
                Picker("Rate", selection: $countryManager.selectedRateIndex) {
                    ForEach(0..<countryManager.allCountries[countryManager.selectedCountryIndex].rates.count, id: \.self) { index in
                        Text("\(countryManager.allCountries[countryManager.selectedCountryIndex].rates[index], specifier: "%.f")%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .onChange(of: countryManager.selectedRateIndex, perform: { value in
                    calculatorViewModel.calculate(rate: countryManager.allCountries[countryManager.selectedCountryIndex].rates[countryManager.selectedRateIndex])
                })
                
                Picker("Operation", selection: $calculatorViewModel.selectedOperation) {
                    ForEach(operations, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .onChange(of: calculatorViewModel.selectedOperation, perform: { value in
                    calculatorViewModel.calculate(rate: countryManager.allCountries[countryManager.selectedCountryIndex].rates[countryManager.selectedRateIndex])
                })
                
                if calculatorViewModel.selectedOperation == "Minus VAT" {
                    Text("VAT -\(calculatorViewModel.VAT, specifier: "%.2f")")
                    Text("Net \(calculatorViewModel.net, specifier: "%.2f")")
                } else if calculatorViewModel.selectedOperation == "Plus VAT" {
                    Text("VAT +\(calculatorViewModel.VAT, specifier: "%.2f")")
                    Text("Net \(calculatorViewModel.net, specifier: "%.2f")")
                }
                
            }.navigationBarTitle("VAT Calculator")
        }
    }
}
