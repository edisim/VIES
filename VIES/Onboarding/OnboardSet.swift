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
    onboardSet.newCard(
      title: "VAT Validation",
      image: "Validation",
      text: NSLocalizedString("onboarding.1", comment: "")
    )
    onboardSet.newCard(
      title: "VAT Calculator",
      image: "Calculate",
      text: NSLocalizedString("onboarding.2", comment: "")
    )
    onboardSet.newCard(
      title: "VAT Rates",
      image: "Check",
      text: NSLocalizedString("onboarding.3", comment: "")
    )
    return onboardSet
  }
}
