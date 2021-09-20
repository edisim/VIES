import Foundation

struct Country: Hashable {
  let name: String
  let countryCode: String
  let standardRate: Double
  let reducedRate: [Double]
  let superReducedRate: Double
  let parkingRate: Double
  let rates: [Double]
  let capital: Capital
}
