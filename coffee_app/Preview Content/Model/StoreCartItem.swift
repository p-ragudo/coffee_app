import SwiftData

@Model
class StoreCartItem {
    var name: String
    var price: Double
    var totalPrice: Double
    var image: String
    var quantity: Int
    var isSelected: Bool
    var account: Account?
    
    init(name: String, price: Double, totalPrice: Double, image: String, quantity: Int, isSelected: Bool, account: Account? = nil) {
        self.name = name
        self.price = price
        self.totalPrice = totalPrice
        self.image = image
        self.quantity = quantity
        self.isSelected = isSelected
        self.account = account
    }
}

