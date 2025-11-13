import Foundation
import SwiftUI

struct Farm: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var ratings: Double
    var image: String
}

