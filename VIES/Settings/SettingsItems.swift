import Foundation

struct Items {
    private let data: [Item] = [
        
        Item(image: "star.fill",
             color: .systemYellow,
             title: "Rate The App",
             section: .feedback,
             url: "https://apps.apple.com/us/app/eu-vat-number-vies-freelance/id1546039758"),
        Item(image: "megaphone.fill",
             color: .systemOrange,
             title: "Provide Feedback",
             section: .feedback,
             url: "https://nikolafranicevic.com/EUVATNumberVIESFreelance/feedback"),
        Item(image: "ladybug.fill",
             color: .systemRed,
             title: "Report A Bug",
             section: .feedback,
             url: "https://nikolafranicevic.com/EUVATNumberVIESFreelance/feedback"),
        
        Item(image: "chevron.left.slash.chevron.right",
             color: .systemGray,
             title: "Source Code",
             section: .miscellaneous,
             url: "https://github.com/FranicevicNikola/VIES"),

        Item(image: "globe",
             color: .systemGray,
             title: "Website",
             section: .miscellaneous,
             url: "https://nikolafranicevic.com/EUVATNumberVIESFreelance/"),
        Item(image: "lock.shield.fill",
             color: .systemGreen,
             title: "Privacy",
             section: .legal,
             url: "https://nikolafranicevic.com/EUVATNumberVIESFreelance/privacypolicy/"),
        Item(image: "plus.app.fill",
             color: .systemGreen,
             title: "More Apps",
             section: .miscellaneous,
             url: "https://apps.apple.com/us/developer/nikola-franicevic/id1538265376"),
        Item(image: "eurosign.circle.fill",
             color: .systemGreen,
             title: "VAT Info",
             section: .help,
             url: "https://ec.europa.eu/taxation_customs/taxation-1/value-added-tax-vat_en")


    ]
    
    let miscellaneous: [Item]
    let legal: [Item]
    let feedback: [Item]
    let help: [Item]
    
    init() {
        miscellaneous = data.filter { $0.section == .miscellaneous }
        legal = data.filter { $0.section == .legal }
        feedback = data.filter { $0.section == .feedback }
        help = data.filter { $0.section == .help }
    }
}

enum ListSection: CaseIterable {
    case miscellaneous
    case legal
    case feedback
    case help
}

struct Item: Identifiable, Hashable {
    
    // MARK: - Types
    enum Color: String, CaseIterable {
        case systemOrange
        case systemBlue
        case systemGreen
        case systemRed
        case systemPurple
        case systemGray
        case cyan
        case systemYellow
        case black
    }
    
    // MARK: - Properties
    var id = UUID()
    let image: String
    let color: Color
    let title: String
    let section: ListSection
    let url: String
}
