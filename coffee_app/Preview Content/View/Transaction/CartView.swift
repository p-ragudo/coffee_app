import SwiftUI
import SwiftData

struct CartView: View {

    private var session = Session.shared
        
    var currentAccount: Account? {
        session.loggedInAccount
    }
    
    var beanCartItems: [BeanCartItem] {
        return currentAccount?.beanCartItems ?? []
    }
    
    var storeCartItems: [StoreCartItem] {
        return currentAccount?.storeCartItems ?? []
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TextPageTitle(text: "Cart")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if currentAccount == nil {
                        Text("Please log in to view your cart.")
                            .foregroundColor(.gray)
                            .padding(.top, 50)
                    }
                    else if beanCartItems.isEmpty && storeCartItems.isEmpty {
                        VStack(alignment: .center) {
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
                        ForEach(beanCartItems) { item in
                            BeanCartItemView(item: item)
                        }
                    }
                    
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
