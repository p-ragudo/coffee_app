import SwiftData

@Model
class Account {
    var username: String
    var email: String
    var password: String
    var beanCartItems = [BeanCartItem]()
    var storeCartItems = [StoreCartItem]()
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
}
