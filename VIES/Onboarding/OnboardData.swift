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
