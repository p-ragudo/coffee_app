import SwiftUI
import SwiftData

struct CartView: View {
//    @Environment(\.modelContext) var context
    @Query(filter: #Predicate<Account> {
        $0.username == Session.shared.loggedInAccount?.username &&
        $0.email == Session.shared.loggedInAccount?.email &&
        $0.password == Session.shared.loggedInAccount?.password
    })
    var loggedInAccount: [Account]
    
    var currentAccount: Account? {
        return loggedInAccount.first
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TextPageTitle(text: "Cart")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if currentAccount.cartItems.isEmpty {
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
                        ForEach(currentAccount?.cartItems) { item in
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
    CartView()
}
