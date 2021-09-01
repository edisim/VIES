import SwiftUI

struct MainView: View {
    @AppStorage("selectedView") var selectedView: String?
    var validCharacters = NSCharacterSet.capitalizedLetters
    var body: some View {
        
            
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
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
