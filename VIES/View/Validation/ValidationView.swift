import SwiftUI

struct ValidationView: View {
    static let tag: String? = "Validation"
    
    @EnvironmentObject var countryManager: CountryManager
    @StateObject var validationViewModel = ValidationViewModel()
    @State private var showingSheet: Bool = false
    @State private var isEditing: Bool = false
    #warning("TAP ON CURLY BRACE TO SELECT IT")
    
    var body: some View {
        NavigationView {
            Form {
                
                Picker("Member State", selection: $countryManager.selectedCountryIndex) {
                    
                    ForEach(0..<countryManager.allCountries.count, id: \.self) { index in
                        Text(countryManager.allCountries[index].name)
                    }
                }
                Section(header: Text("VAT Number")) {
                    HStack {
                        Text(countryManager.allCountries[countryManager.selectedCountryIndex].countryCode)
                        TextField("\(validationViewModel.placeholderNumberVAT)", text: $validationViewModel.numberVAT)
                            .disableAutocorrection(true)
                            .onTapGesture {
                                isEditing = true
                            }
                        
                    }
                    
                }
                Section(header: Text("Recent Validation")) {
                    HStack {
                        Text(settings.string(forKey: "RecentValidation") ?? "None")
                        Spacer()
                    }
                    Button(action: {
                        validationViewModel.validateVAT(settings.string(forKey: "RecentValidation") ?? "None")
                        showingSheet = true
                        
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("Retry")
                        }
                    }.disabled(settings.string(forKey: "RecentValidation") == "None")
                    Button(action: {pasteboard.string = settings.string(forKey: "RecentValidation") ?? "None"}) {
                        HStack {
                            
                            Image(systemName: "doc.on.doc")
                            Text("Copy")
                        }
                    }.disabled(settings.string(forKey: "RecentValidation") == "None")
                }
                
            }.navigationBarTitle("VAT Validation")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.isEditing = false
                                        validationViewModel.validateVAT("\(countryManager.allCountries[countryManager.selectedCountryIndex].countryCode)"+"\(validationViewModel.numberVAT)")
                                        showingSheet = true
                                        
                                    }) {
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
