import SwiftUI

struct CountryRatesListView: View {
    static let tag: String? = "Rates"
    @State private var searchText = ""
    @EnvironmentObject var countryManager: CountryManager
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<countryManager.countries.count, id: \.self) { index in
                        NavigationLink(destination: CountryRateDetailView(country: countryManager.countries[index])) {
                            Text(countryManager.countries[index].name)
                        }
                    }
                }.listStyle(PlainListStyle())
                .navigationBarTitle("VAT Rates")
            }
        }
    }
}
#warning("FIX ALL previews!")
//struct CountryRatesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryRatesListView(countries: Country.all)
//    }
//}
