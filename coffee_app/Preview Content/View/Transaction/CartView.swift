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
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                                                
                            Text("No items in cart yet")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.vertical)
                        }
                    } else {
                        // Display cart items if the cart is not empty
                        ForEach(cartController.cartItems) { item in
                            CartItemView(cartController: cartController, item: item)
                        }
                    }

                    TextSection(
                        text: "Total: ₱ \(String(format: "%.2f", cartController.totalPrice()))",
                        size: 24,
                        weight: .bold,
                        color: ThemeColor.brown
                    )
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
