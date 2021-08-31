import Foundation
import UIKit

class OnboardSet {
    private(set) var cards: [OnboardCard] = []
    private(set) var width: CGFloat = .infinity
    private(set) var height: CGFloat = .infinity
    
    init() {
        print("initialising OnboardSet")
    }
    
    
    func dimensions(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    func newCard(title: String, image: String, text: String, videoInfo: OnboardCard.VideoInfo? = nil, linkInfo: OnboardCard.LinkInfo? = nil) {
        cards.append(OnboardCard(title: title, image: image, text: text, videoInfo: videoInfo, linkInfo: linkInfo))
    }
}

extension OnboardSet {
    static func previewSet() -> OnboardSet {
        let onboardSet = OnboardSet()
        onboardSet.newCard(title: "VAT Validation",
                           image: "Validation",
                           text: "Quickly check if your VAT number is valid or not. Choose your member state, enter your VAT number, and tap verify in the top right corner.")
        onboardSet.newCard(title: "VAT Calculator",
                           image: "Calculate",
                           text: "Calculate your income in a snap. Exclude or include VAT at various rates.")
        onboardSet.newCard(title: "VAT Rates",
                           image: "Check",
                           text: "What EU countries have the lowest VAT rates? What types of rates even exist? Find out by tapping the desired country.")
        return onboardSet
    }
}
