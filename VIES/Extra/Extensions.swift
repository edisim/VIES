import Foundation
import SwiftUI

extension String {
  var containsOnlyDigits: Bool {
    let notDigits = NSCharacterSet.decimalDigits.inverted
    return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
  }
}

extension UserDefaults {
  public func optionalInt(forKey defaultName: String) -> Int? {
    let defaults = self
    if let value = defaults.value(forKey: defaultName) {
      return value as? Int
    }
    return nil
  }
}
