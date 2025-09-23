import Foundation
import SwiftUI

struct StoreProductType: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var desc: String
    var type: String
    var navigateTo: AnyView
}

class StoreProductTypeProvider {
    static func getItems() -> [StoreProductType] {
        return [
            // REPLACE EACH IMAGE AND NAVIGATION DESTINATION TO THE APPROPRIATE ONE
            StoreProductType(image: "grinders_card", name: "Grinders", desc: "From manual to fully-automatic, we have it all", type: ProductType.essentials, navigateTo: AnyView(WelcomeView())),
            StoreProductType(image: "brewers_card", name: "Brewers", desc: "Moka pots, French presses, Pour-over, and more!", type: ProductType.essentials, navigateTo: AnyView(WelcomeView())),
            StoreProductType(image: "machines_card", name: "Machines", desc: "Espresso makers, drip brewers, and more!", type: ProductType.luxury, navigateTo: AnyView(WelcomeView())),
            StoreProductType(image: "acs_card", name: "Accessories", desc: "Filters, tampers, stirrers, and more essentials!", type: ProductType.accessories, navigateTo: AnyView(WelcomeView())),
        ]
    }
}

