import SwiftUI

@main
struct VIESApp: App {
  @StateObject var countryManager = CountryManager()
  @State private var showOnboarding = false
  @AppStorage("OnboardBeenViewed") var hasOnboarded = false
  var onboardSet = OnboardData.buildSet(width: .infinity, height: .infinity)
  var body: some Scene {
    WindowGroup {
      ZStack {
        MainView()
          .environmentObject(countryManager)
          .disabled(showOnboarding)
          .blur(radius: showOnboarding ? 5.0 : 0)
        if showOnboarding {
          OnboardingScreenView(showOnboarding: $showOnboarding, onboardSet: onboardSet)
        }
      }.onAppear {
        AppReviewRequest.requestReviewIfNeeded()
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
}
