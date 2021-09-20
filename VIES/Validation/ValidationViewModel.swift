import Foundation
import SwiftUI

class ValidationViewModel: ObservableObject {

    init(isForPreview: Bool = false) {
        print("initialising ValidationViewModel")
        if !isForPreview {
            // Get my data and set to my items array
        }
    }

    @Published var numberVAT: String = UserDefaults.standard.string(forKey: "numberVAT") ?? "" {
        didSet {
            UserDefaults.standard.set(numberVAT, forKey: "numberVAT")
            print("setting numberVAT - \(numberVAT) - UserDefaults")
        }
    }
    #warning("namisti placeholder Text da da ko tutorial info")
    @Published var placeholderNumberVAT: String = ""
    @Published var response: Response = Response(valid: false, vatNumber: "", name: "", address: "", countryCode: "")
    // Read only
    var selectedCountryIndex = UserDefaults.standard.optionalInt(forKey: "selectedCountryIndex")

    func checkInput() -> Bool {
        #warning("Input must be Integer")
        var baseRule: Bool {
            if numberVAT.isEmpty || numberVAT.contains(" ") || numberVAT.count > 12 {
                return true
            } else {
                return false
            }
        }

        switch selectedCountryIndex {
        case 0:
            if baseRule || numberVAT.first != "U"  || numberVAT.count != 9 {
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
        case 12, 15, 18:
            if baseRule || numberVAT.count != 11 {
                placeholderNumberVAT = ""
                return true
            } else {
                return false
            }
        case 3:
            if baseRule || numberVAT.count != 9 || ((numberVAT.last?.isLetter) != true) {
                return true
            } else {
                return false
            }
        case 4:
            if baseRule || numberVAT.count != 10 && numberVAT.count != 9 && numberVAT.count != 8 {
                return true
            } else {
                return false
            }
        case 6, 10, 13, 17, 19, 25 :
            if baseRule || numberVAT.count != 8 {
                return true
            } else {
                return false
            }
        case 7, 5, 8, 22, 9:
            if baseRule || numberVAT.count != 9 {
                return true
            } else {
                return false
            }
        case 21, 26:
            if baseRule || numberVAT.count != 10 {
                return true
            } else {
                return false
            }
        case 23:
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
        case 11:
            if baseRule || numberVAT.count != 11 {
                return true
            } else {
                return false
            }

        //8 or 9 characters. Includes one or two alphabetical characters (last, or second and last, or last 2).
        case 14:
            if baseRule || numberVAT.count != 9 && numberVAT.count != 8 {
                return true
            } else {
                return false
            }

        // 12 characters. The tenth character is always B.
        case 20:
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

    /// <#Description#>
    /// - Parameter VAT: <#VAT description#>
    func validateVAT(_ VAT: String) {

        let url: URL? = URL(string: "https://api.vatcomply.com/vat?vat_number=\(VAT)")
        var request = URLRequest(url: (url ?? URL(string: "https://api.vatcomply.com/vat?vat_number="))!)
        request.addValue("__cfduid=db6f000a97f4db915610c6c2043af38c11608235266", forHTTPHeaderField: "Cookie")

        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                print(String(describing: error))
                return
            }
            DispatchQueue.main.async {
                self.response = response
                print(String(data: data, encoding: .utf8)!)
            }

        }.resume()
        #warning("needs a better way!")
        UserDefaults.standard.set("\(VAT)", forKey: "RecentValidation")
        print("setting VAT - \(VAT) - UserDefaults")
    }

}
