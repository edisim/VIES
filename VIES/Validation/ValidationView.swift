import SwiftUI

struct ValidationView: View {
  static let tag: String? = "Validation"
  @EnvironmentObject var countryManager: CountryManager
  @StateObject var validationViewModel = ValidationViewModel()
  @State private var showingSheet: Bool = false
  @State private var isEditing: Bool = false
  var body: some View {
    NavigationView {
      Form {
        Picker("Member State", selection: $countryManager.selectedCountryIndex) {
          ForEach(0..<countryManager.countries.count, id: \.self) { index in
            Text(countryManager.countries[index].name)
          }
        }
        Section(header: Text("VAT Number")) {
          HStack {
            Text(countryManager.countries[countryManager.selectedCountryIndex].countryCode)
            TextField("\(validationViewModel.placeholderNumberVAT)", text: $validationViewModel.numberVAT)
              .disableAutocorrection(true)
              .onTapGesture {
                isEditing = true
              }
          }
        }
        Section(header: Text("Recent Validation")) {
          HStack {
            Text(UserDefaults.standard.string(forKey: "RecentValidation") ?? "None")
            Spacer()
          }
          Button {
            validationViewModel.validateVAT(UserDefaults.standard.string(forKey: "RecentValidation") ?? "None")
            showingSheet = true
          } label: {
            HStack {
              Image(systemName: "arrow.clockwise")
              Text("Retry")
            }
            #warning("it does not disable the button")
          }.disabled(UserDefaults.standard.string(forKey: "RecentValidation") == "None")
          Button { UIPasteboard.general.string = UserDefaults.standard.string(forKey: "RecentValidation") ?? "None" } label: {
            HStack {
              Image(systemName: "doc.on.doc")
              Text("Copy")
            }
          }.disabled(UserDefaults.standard.string(forKey: "RecentValidation") == "None")
        }
      }.navigationBarTitle("VAT Validation")
      .navigationBarItems(trailing: Button {
        self.isEditing = false
        validationViewModel.validateVAT("\(countryManager.countries[countryManager.selectedCountryIndex].countryCode)"+"\(validationViewModel.numberVAT)")
        showingSheet = true
      } label: {
        Text("Verify")
      }.disabled(validationViewModel.checkInput())
      )
    }.sheet(isPresented: $showingSheet) {
      ValidationSheetView(response: validationViewModel.response)
    }
    .onAppear {
      AppReviewRequest.requestReviewIfNeeded()
    }
  }
}
