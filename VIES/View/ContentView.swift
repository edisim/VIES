import SwiftUI

struct ContentView: View {
    
    @AppStorage("selectedView") var selectedView: String?
    var validCharacters = NSCharacterSet.capitalizedLetters
    @State private var showOnboarding = false
    @AppStorage("OnboardBeenViewed") var hasOnboarded = false
    var onboardSet = OnboardData.buildSet(width: .infinity, height: .infinity)
    #warning("User can save his VAT number so he does not need to enter it every time")
    
    @EnvironmentObject var countryManager: CountryManager
    
    var body: some View {
        
        ZStack {
            
            TabView(selection: $selectedView) {
                
                
                ValidationView()
                    .tag(ValidationView.tag)
                    .tabItem { Label("Validation", systemImage: "checkmark") }
                
                CalculatorView()
                    .tag(CalculatorView.tag)
                    .tabItem { Label("Calculator", systemImage: "percent")}
                
                CountryRatesListView()
                    .tag(CountryRatesListView.tag)
                    .tabItem { Label("Rates", systemImage: "info") }
                
                SettingsView()
                    .tag(SettingsView.tag)
                    .tabItem { Label("Settings", systemImage: "gear") }
                
            }.disabled(showOnboarding)
            .blur(radius: showOnboarding ? 5.0 : 0)
            
            if showOnboarding {
                OnboardingScreens(showOnboarding: $showOnboarding, onboardSet: onboardSet)
            }

        }.onAppear {
            #warning("ONBOARDING")
            //hasOnboarded = false // here for testing
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
