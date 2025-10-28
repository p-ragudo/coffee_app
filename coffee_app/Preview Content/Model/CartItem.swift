import Foundation

struct CartItem: Identifiable, Codable {
    var id = UUID()  
    var name: String
    var price: Double
    var image: String
    var quantity: Int
    var isSelected: Bool
}
