import SwiftData

@Model
class CartItem {
    var name: String
    var price: Double
    var image: String
    var quantity: Int
    var isSelected: Bool
    var account: Account?
    
    init(name: String, price: Double, image: String, quantity: Int, isSelected: Bool, account: Account? = nil) {
        self.name = name
        self.price = price
        self.image = image
        self.quantity = quantity
        self.isSelected = isSelected
        self.account = account
    }
}
