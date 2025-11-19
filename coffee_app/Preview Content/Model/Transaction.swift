import SwiftData

@Model
class Transaction {
    var total: Double
    var beanCartItems = [BeanCartItem]()
    var storeCartItems = [StoreCartItem]()
    
    init(total: Double) {
        self.total = total
    }
}
