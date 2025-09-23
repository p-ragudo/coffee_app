import Foundation
import SwiftUI

struct BeanType: Identifiable {
    var id = UUID()
    var name: String
    var desc: String
    var popularity: String
    var rating: Double
    var navigateTo: any View
}

class BeanTypeProvider {
    static func getCoffeeItems() -> [BeanType] {
        return [
            BeanType(name: "Arabica", desc: "Sweet and classic, perfect for every taste", popularity: PopularityLevel.top_favorite, rating: 5.0, navigateTo: WelcomeView()),
            BeanType(name: "Robusta", desc: "Strong & bold tone, perfect for espressos", popularity: PopularityLevel.trending, rating: 4.8, navigateTo: WelcomeView()),
            BeanType(name: "Liberica", desc: "Filipino-style kapeng barako", popularity: PopularityLevel.rising, rating: 4.5, navigateTo: WelcomeView()),
            BeanType(name: "Excelsa", desc: "Unique and fruity, for those who want something new", popularity: PopularityLevel.spotlight, rating: 4.2, navigateTo: WelcomeView()),
        ]
    }
}
