import SwiftUI

@main
struct VIESApp: App {
    @StateObject var countryManager = CountryManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(countryManager)
        }
    }
}
