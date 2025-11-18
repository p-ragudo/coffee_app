import SwiftData

@Model
class BeanCartItem {
    var name: String
    var price: Double
    var totalPrice: Double
    var image: String
    var quantity: Int
    var roastType: String
    var size: String
    var isSelected: Bool
    var account: Account?
    
    init(name: String, price: Double, totalPrice: Double, image: String, quantity: Int, roastType: String, size: String, isSelected: Bool, account: Account? = nil) {
        self.name = name
        self.price = price
        self.totalPrice = totalPrice
        self.image = image
        self.quantity = quantity
        self.roastType = roastType
        self.size = size
        self.isSelected = isSelected
        self.account = account
    }
    
    static func matches(_ cartItem: BeanCartItem, product: BeanProduct, roastType: String, size: String) -> Bool {
        return cartItem.name == product.name &&
               cartItem.price == product.price &&
               cartItem.image == product.image &&
               cartItem.roastType == roastType && // Include specific selections
               cartItem.size == size
    }
}
