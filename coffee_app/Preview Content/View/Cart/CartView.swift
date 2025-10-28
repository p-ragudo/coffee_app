import SwiftUI

struct CartView: View {
    @StateObject var cartController = CartController()  // Use CartController to manage data
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TextPageTitle(text: "Cart")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if cartController.cartItems.isEmpty {
                        VStack {
                            Image(systemName: "cart.fill.badge.plus") // Placeholder image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.gray)
                                                
                            Text("No items in cart yet")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                        }
                    } else {
                        // Display cart items if the cart is not empty
                        ForEach(cartController.cartItems) { item in
                            CartItemView(cartController: cartController, item: item)
                        }
                    }
                    
                    // Display total price of selected items
                    Text("Total: P \(String(format: "%.2f", cartController.totalPrice()))")
                        .font(.title)
                        .foregroundColor(.orange)
                        .padding()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            }
            .background(Color.black)
        }
        .toolbarBackground(.black, for: .navigationBar)
    }
}

#Preview {
    CartView(cartController: CartController())
}
