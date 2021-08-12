import SwiftUI

struct ContentView: View {
    
    @AppStorage("selectedView") var selectedView: String?
    var validCharacters = NSCharacterSet.capitalizedLetters
    @State private var selectedCountry = Country.austria
    @State private var showOnboarding = false
    @AppStorage("OnboardBeenViewed") var hasOnboarded = false
    var onboardSet = OnboardData.buildSet(width: .infinity, height: .infinity)
    #warning("User can save his VAT number so he does not need to enter it every time")
    var countries = Country.all
    var body: some View {
        
        ZStack {
            
            TabView(selection: $selectedView) {
                
                
                ValidationView(selectedCountry: $selectedCountry, countries: countries)
                    .tag(ValidationView.tag)
                    .tabItem { Label("Validation", systemImage: "checkmark") }
                
                CalculatorView(selectedCountry: $selectedCountry, countries: countries)
                    .tag(CalculatorView.tag)
                    .tabItem { Label("Calculator", systemImage: "percent")}
                
                CountryRatesListView(countries: countries)
                    .tag(CountryRatesListView.tag)
                    .tabItem { Label("Rates", systemImage: "info") }
                
                SettingsView()
                    .tag(SettingsView.tag)
                    .tabItem { Label("Settings", systemImage: "gear") }
                
            }.disabled(showOnboarding)
            .blur(radius: showOnboarding ? 3.0 : 0)
            
            if showOnboarding {
                OnboardingScreens(showOnboarding: $showOnboarding, onboardSet: onboardSet)
            }
//            .sheet(isPresented: $showOnboarding) {
//                VStack {
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//                            showOnboarding.toggle()
//
//                        })  {
//                            Image(systemName: "xmark.circle.fill")
//                                .font(.largeTitle)
//                        }
//
//                    }
//                    Rectangle()
//                        .frame(width: 350, height: 350)
//                    Spacer()
//                }
//            }
        }.onAppear {
           // hasOnboarded = false // here for testing
            // When the user dismisses the onboarding view by swiping down, we will also consider onboarding as complete
            if !hasOnboarded {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showOnboarding.toggle()
                        hasOnboarded = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
