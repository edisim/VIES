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
          #warning("you can dismiss keyboard in iOS 15")
          TextField("", value: $calculatorViewModel.amount, formatter: formatter)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .disableAutocorrection(true)
            .font(Font.title.weight(.bold))
            .padding()
            .onChange(of: calculatorViewModel.amount) { _ in
              calculatorViewModel.calculate(rate: countryManager.countries[countryManager.selectedCountryIndex].rates[countryManager.selectedRateIndex])
            }
        }
        Picker("Member State", selection: $countryManager.selectedCountryIndex) {
          ForEach(0..<countryManager.countries.count, id: \.self) { index in
            Text(countryManager.countries[index].name)
          }
        }.onChange(of: countryManager.selectedCountryIndex, perform: { _ in
          countryManager.selectedRateIndex = 0
          calculatorViewModel.calculate(rate: countryManager.countries[countryManager.selectedCountryIndex].rates[countryManager.selectedRateIndex])
        })
        #warning("Refactor!")
        Picker("Rate", selection: $countryManager.selectedRateIndex) {
          ForEach(0..<countryManager.countries[countryManager.selectedCountryIndex].rates.count, id: \.self) { index in
            Text("\(countryManager.countries[countryManager.selectedCountryIndex].rates[index], specifier: "%.f")%")
          }
        }.pickerStyle(SegmentedPickerStyle())
        .onChange(of: countryManager.selectedRateIndex, perform: { _ in
          calculatorViewModel.calculate(rate: countryManager.countries[countryManager.selectedCountryIndex].rates[countryManager.selectedRateIndex])
        })
        Picker("Operation", selection: $calculatorViewModel.selectedOperation) {
          ForEach(operations, id: \.self) {
            Text($0)
          }
        }.pickerStyle(SegmentedPickerStyle())
        .onChange(of: calculatorViewModel.selectedOperation, perform: { _ in
          calculatorViewModel.calculate(rate: countryManager.countries[countryManager.selectedCountryIndex].rates[countryManager.selectedRateIndex])
        })
        if calculatorViewModel.selectedOperation == "Minus VAT" {
          Text("VAT -\(calculatorViewModel.VAT, specifier: "%.2f")")
          Text("Net \(calculatorViewModel.net, specifier: "%.2f")")
        } else if calculatorViewModel.selectedOperation == "Plus VAT" {
          Text("VAT +\(calculatorViewModel.VAT, specifier: "%.2f")")
          Text("Net \(calculatorViewModel.net, specifier: "%.2f")")
        }
      }.navigationBarTitle("Calculator")
    }
  }
}
