import Foundation
import SwiftUI

struct BeanType: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var desc: String
    var popularity: String
    var rating: Double
}

class BeanTypeProvider {
    static func getItems() -> [BeanType] {
        return [
            BeanType(image: "arabica_card", name: "Arabica", desc: "Sweet and classic, perfect for every taste", popularity: PopularityLevel.top_favorite, rating: 5.0),
            BeanType(image: "robusta_card", name: "Robusta", desc: "Strong & bold tone, perfect for espressos", popularity: PopularityLevel.trending, rating: 4.8),
            BeanType(image: "liberica_card", name: "Liberica", desc: "Filipino-style kapeng barako", popularity: PopularityLevel.rising, rating: 4.5),
            BeanType(image: "excelsa_card", name: "Excelsa", desc: "Unique and fruity, something new", popularity: PopularityLevel.spotlight, rating: 4.2),
        ]
    }
}
