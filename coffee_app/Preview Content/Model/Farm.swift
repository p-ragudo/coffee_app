import Foundation
import SwiftUI

struct Farm: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var ratings: Double
    var image: String
}

class FarmsProvider {
    static func getFarms() -> [Farm] {
        return [
            Farm(name: "Farm 1", location: "Location 1", ratings: 4.5, image: "farm_card"),
            Farm(name: "Farm 2", location: "Location 2", ratings: 4.0, image: "farm_card"),
            Farm(name: "Farm 3", location: "Location 3", ratings: 4.0, image: "farm_card"),
            Farm(name: "Farm 4", location: "Location 4", ratings: 4.0, image: "farm_card"),
            Farm(name: "Farm 5", location: "Location 5", ratings: 4.0, image: "farm_card"),
        ]
    }
}
