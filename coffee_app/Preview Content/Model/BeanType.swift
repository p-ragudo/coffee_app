import Foundation
import SwiftUI

struct BeanType: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var popularity: String
    var navigateTo: any View
}

class BeanTypeProvider {
    static func getCoffeeItems() -> [BeanType] {
        return [
            BeanType(name: "Espresso", description: "Strong coffee.", popul: "espresso", navigateTo: WelcomeView()),
            BeanType(title: "Latte", description: "Coffee with milk.", image: "latte"),
            BeanType(title: "Cappuccino", description: "Coffee with foam.", image: "cappuccino"),
            BeanType(title: "Americano", description: "Coffee with water.", image: "americano")
        ]
    }
}
