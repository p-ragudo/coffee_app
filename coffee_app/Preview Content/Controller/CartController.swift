import Foundation

class CartController: ObservableObject {
    @Published var cartItems: [CartItem] = []  // This will be the cart's data
    
    // Load cart data from UserDefaults
    init() {
//        self.cartItems = [
//                    CartItem(name: "Dark Roast Coffee", price: 200, image: "arabica_card", quantity: 2, isSelected: false),
//                    CartItem(name: "Light Roast Coffee", price: 150, image: "arabica_card", quantity: 1, isSelected: true),
//                    CartItem(name: "Espresso Beans", price: 300, image: "arabica_card", quantity: 3, isSelected: false)
//                ]
        UserDefaults.standard.removeObject(forKey: "cartItems")
        loadCartItems()
    }
    
    // Save cart data to UserDefaults
    func saveCartItems() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cartItems) {
            UserDefaults.standard.set(encoded, forKey: "cartItems")
        }
    }
    
    // Load cart data from UserDefaults
    func loadCartItems() {
        if let savedData = UserDefaults.standard.data(forKey: "cartItems") {
            let decoder = JSONDecoder()
            if let loadedItems = try? decoder.decode([CartItem].self, from: savedData) {
                self.cartItems = loadedItems
            }
        }
    }
    
    // Add item to cart
    func addItem(_ item: CartItem) {
        cartItems.append(item)
        saveCartItems()  // Persist data after modification
    }
    
    // Remove item from cart
    func removeItem(at index: Int) {
        cartItems.remove(at: index)
        saveCartItems()  // Persist data after modification
    }
    
    // Toggle item selection
    func toggleSelection(for item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].isSelected.toggle()
            saveCartItems()  // Persist data after modification
        }
    }
    
    // Increase item quantity
    func increaseQuantity(for item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity += 1
            saveCartItems()  // Persist data after modification
        }
    }
    
    // Decrease item quantity
    func decreaseQuantity(for item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
                saveCartItems()  // Persist data after modification
            }
        }
    }
    
    // Calculate total price of selected items
    func totalPrice() -> Double {
        return cartItems.filter { $0.isSelected }.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
}
