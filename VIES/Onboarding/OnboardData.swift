import Foundation
import UIKit

enum OnboardData {
  /*
   Adding Video:
   - image: "videoName.mov"
   - videoInfo: OnboardCard.VideoInfo(originalWidth: ,originalHeight: , newHeight:)
   */
  static func buildSet(width: CGFloat = .infinity, height: CGFloat = .infinity) -> OnboardSet {
    let onboardSet = OnboardSet()
    onboardSet.dimensions(width: width, height: height)
    onboardSet.newCard(
      title: "Validation",
      image: "Validation",
      text: NSLocalizedString("onboarding.1", comment: "")
    )
    onboardSet.newCard(
      title: "Calculator",
      image: "Calculate",
      text: NSLocalizedString("onboarding.2", comment: "")
    )
    onboardSet.newCard(
      title: "Rates",
      image: "Check",
      text: NSLocalizedString("onboarding.3", comment: "")
    )
    return onboardSet
  }
}
