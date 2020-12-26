//
//  ContentView.swift
//  VIES
//
//  Created by Master Family on 17/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    // TODO: Tab bar ko i u prvoj aplikaciji
    @AppStorage("selectedView") var selectedView: String?
    @State private var numberVAT = ""
    @State private var countryCodeVAT = ""
    @State private var numberFormatVAT = ""
    @State private var showingSheet = false
    @State private var response = Response(valid: false, vatNumber: "", name: "", address: "", countryCode: "")
    @State private var selectedCountry = 0
    var countries = ["Austria 🇦🇹", "Belgium 🇧🇪", "Bulgaria 🇧🇬", "Croatia 🇭🇷", "Cyprus 🇨🇾", "Czechia 🇨🇿", "Denmark 🇩🇰", "Estonia 🇪🇪", "Finland 🇫🇮", "France 🇫🇷", "Germany 🇩🇪", "Greece 🇬🇷", "Hungary 🇭🇺", "Ireland 🇮🇪", "Italy 🇮🇹", "Latvia 🇱🇻", "Lithuania 🇱🇹", "Luxembourg 🇱🇺", "Malta 🇲🇹", "Netherlands 🇳🇱", "Poland 🇵🇱", "Portugal 🇵🇹", "Romania 🇷🇴", "Slovakia 🇸🇰", "Slovenia 🇸🇮", "Spain 🇪🇸", "Sweden 🇸🇪"]
    var validCharacters = NSCharacterSet.capitalizedLetters
    //TODO: User can save his VAT number so he does not need to enter it every time (USERDEFAULTS)
    var body: some View {
        TabView(selection: $selectedView) {
            NavigationView {
                Form {
                    
                    Picker(selection: $selectedCountry, label: Text("Member State")) {
                        ForEach(0 ..< countries.count) {
                            Text(countries[$0]).tag($0)
                        }
                    }
                    Section(header: Text("VAT Number")) {
                        HStack {
                            Text("\(countryCodeVAT)")
                            TextField("\(numberFormatVAT)", text: $numberVAT)
                                .disableAutocorrection(true)
                                .keyboardType(.numberPad)
                            
                        }
                    }
                    
                    
                    
                    Button(action: {validateVAT("\(countryCodeVAT)"+"\(numberVAT)")}) {
                        Text("Verify")
                    }
                    .disabled(checkInput())
                    
                    
                }.navigationBarTitle("VAT Validation")
                .onAppear {
                    countryToCountryCode(selectedCountry: selectedCountry)
                }
                
            }.sheet(isPresented: $showingSheet) {
                ValidationSheetView(response: response)
            }
            .tabItem { Label("Validation", systemImage: "checkmark.circle.fill") }
            
            CalculatorView()
                .tabItem { Label("Calculator", systemImage: "percent") }
        }
        
    }
    
    func checkInput() -> Bool {
        //TODO: Input must be Integer
        var baseRule: Bool {
            if numberVAT.isEmpty || numberVAT.contains(" ") || numberVAT.count > 12  {
                return true
            } else {
                return false
            }
        }
        
        switch selectedCountry {
        case 0:
            if baseRule || numberVAT.first != "U"  || numberVAT.count != 9{
                return true
            } else {
                return false
            }
        // Prefix with zero ‘0’ if the customer provides a 9 digit VAT number ZA CASE 1.
        case 1, 2:
            if baseRule || numberVAT.count != 10 && numberVAT.count != 9 {
                return true
            } else {
                return false
            }
        case 3, 14, 15:
            if baseRule || numberVAT.count != 11 {
                return true
            } else {
                return false
            }
        case 4:
            if baseRule || numberVAT.count != 9 || ((numberVAT.last?.isLetter) != true){
                return true
            } else {
                return false
            }
        case 5:
            if baseRule || numberVAT.count != 10 && numberVAT.count != 9 && numberVAT.count != 8{
                return true
            } else {
                return false
            }
        case 6, 8, 12, 17, 18, 24 :
            if baseRule || numberVAT.count != 8 {
                return true
            } else {
                return false
            }
        case 7, 10, 11, 21, 25:
            if baseRule || numberVAT.count != 9 {
                return true
            } else {
                return false
            }
        case 20, 23:
            if baseRule || numberVAT.count != 10 {
                return true
            } else {
                return false
            }
        case 22:
            if baseRule || numberVAT.count > 10 || numberVAT.count < 2 {
                return true
            } else {
                return false
            }
        case 16:
            if baseRule || numberVAT.count != 12 && numberVAT.count != 9 {
                return true
            } else {
                return false
            }
           
            
        // 11 characters. May include alphabetical characters (any except O or I) as first or second or first and second characters.
        case 9:
            if baseRule || numberVAT.count != 11  {
                return true
            } else {
                return false
            }
            
        //8 or 9 characters. Includes one or two alphabetical characters (last, or second and last, or last 2).
        case 13:
            if baseRule || numberVAT.count != 9 && numberVAT.count != 8{
                return true
            } else {
                return false
            }
            
            
        // 12 characters. The tenth character is always B.
        case 19:
            if baseRule || numberVAT.count != 12 {
                return true
            } else {
                return false
            }

            
        default:
            if baseRule || numberVAT.count != 12 {
                return true
            } else {
                return false
            }
        }
        
    }
    
    func countryToCountryCode(selectedCountry: Int) {
        switch selectedCountry {
        case 0:
            countryCodeVAT = "AT"
            numberFormatVAT = "e.g. U12345678"
        case 1:
            countryCodeVAT = "BE"
            numberFormatVAT = "e.g. 1234567890"
        case 2:
            countryCodeVAT = "BG"
            numberFormatVAT = "e.g. 123456789"
        case 3:
            countryCodeVAT = "HR"
            numberFormatVAT = "e.g. 12345678901"
        case 4:
            countryCodeVAT = "CY"
            numberFormatVAT = "e.g. 12345678X"
        case 5:
            countryCodeVAT = "CZ"
            numberFormatVAT = "e.g. 12345678"
        case 6:
            countryCodeVAT = "DK"
            numberFormatVAT = "e.g. 12345678"
        case 7:
            countryCodeVAT = "EE"
            numberFormatVAT = "e.g. 123456789"
        case 8:
            countryCodeVAT = "FI"
            numberFormatVAT = "e.g. 12345678"
        case 9:
            countryCodeVAT = "FR"
            numberFormatVAT = "e.g. XX123456789"
        case 10:
            countryCodeVAT = "DE"
            numberFormatVAT = "e.g. 123456789"
        case 11:
            countryCodeVAT = "EL"
            numberFormatVAT = "e.g. 123456789"
        case 12:
            countryCodeVAT = "HU"
            numberFormatVAT = "e.g. 12345678"
        case 13:
            countryCodeVAT = "IE"
            numberFormatVAT = "e.g. 1234567X"
        case 14:
            countryCodeVAT = "IT"
            numberFormatVAT = "e.g. 12345678901"
        case 15:
            countryCodeVAT = "LV"
            numberFormatVAT = "e.g. 12345678901"
        case 16:
            countryCodeVAT = "LT"
            numberFormatVAT = "e.g. 123456789"
        case 17:
            countryCodeVAT = "LU"
            numberFormatVAT = "e.g. 12345678"
        case 18:
            countryCodeVAT = "MT"
            numberFormatVAT = "e.g. 12345678"
        case 19:
            countryCodeVAT = "NL"
            numberFormatVAT = "e.g. 123456789B01"
        case 20:
            countryCodeVAT = "PL"
            numberFormatVAT = "e.g. 1234567890"
        case 21:
            countryCodeVAT = "PT"
            numberFormatVAT = "e.g. 123456789"
        case 22:
            countryCodeVAT = "RO"
            numberFormatVAT = "e.g. 12"
        case 23:
            countryCodeVAT = "SK"
            numberFormatVAT = "e.g. 1234567890"
        case 24:
            countryCodeVAT = "SI"
            numberFormatVAT = "e.g. 12345678"
        case 25:
            countryCodeVAT = "ES"
            numberFormatVAT = "e.g. 12345678X"
        default:
            countryCodeVAT = "SE"
            numberFormatVAT = "e.g. 123456789012"
        }
    }
    
    func validateVAT(_ VAT: String) {
        
        let semaphore = DispatchSemaphore (value: 0)
        let url: URL? = URL(string: "https://api.vatcomply.com/vat?vat_number=\(VAT)")
        var request = URLRequest(url: (url ?? URL(string: "https://api.vatcomply.com/vat?vat_number="))!)
        request.addValue("__cfduid=db6f000a97f4db915610c6c2043af38c11608235266", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            let decodedResponse = try? JSONDecoder().decode(Response.self, from: data)
            self.response = decodedResponse ?? Response(valid: false, vatNumber: "\(numberVAT)", name: "N/A", address: "N/A", countryCode: "\(countryCodeVAT)")
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        showingSheet = true
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
