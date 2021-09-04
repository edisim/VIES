import SwiftUI

struct OnboardingScreens: View {
    @Binding var showOnboarding: Bool
    var onboardSet: OnboardSet
    var body: some View {
        VStack {
            TabView {
                ForEach(onboardSet.cards) { card in
                    OnboardingCardView(isShowing: $showOnboarding, card: card, width: onboardSet.width, height: onboardSet.height)
                }
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

        }.shadow(radius: 5)
        .edgesIgnoringSafeArea(.all)
        .padding()
    }
}
