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
    
    var selectedBeanCartItems: [BeanCartItem] {
        beanCartItems.filter { $0.isSelected }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
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
                            if !beanCartItems.isEmpty {
                                ForEach(beanCartItems) { item in
                                    BeanCartItemView(item: item)
                                }
                            }
                            if !storeCartItems.isEmpty {
                                ForEach(storeCartItems) { item in
                                    StoreCartItemView(item: item)
                                }
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                } // ScrollView
                .background(Color.black)
                
                VStack {
                    Spacer()
                    
                    ForEach(beanCartItems, id: \.name) { item in
                        rowElement(name: item.name, total: item.totalPrice)
                    }
                    ForEach(storeCartItems, id: \.name) { item in
                        rowElement(name: item.name, total: item.totalPrice)
                    }
                }
                
            } // ZStack
        }
        .toolbarBackground(.black, for: .navigationBar)
    }
}

struct rowElement: View {
    var name: String
    var total: Double
    
    var body: some View {
        HStack {
            TextParagraph(text: name)
            Spacer()
            TextParagraph(text: String(format: "%.2f", total))
        } // HStack
    }
}

#Preview {
    CartView()
}
