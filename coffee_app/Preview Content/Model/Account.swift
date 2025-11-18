import SwiftData

@Model
class Account {
    var username: String
    var email: String
    var password: String
    var cartItems = [BeanCartItem]()
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
}
