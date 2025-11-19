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
        return beanCartItems.filter { $0.isSelected == true }
    }
    var selectedStoreCartItems: [StoreCartItem] {
        return storeCartItems.filter { $0.isSelected == true }
    }
    
    @Environment(\.modelContext) private var context
    
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
                    
                    HStack {
                        TextSection(
                            text: "Total:",
                            color: ThemeColor.brown
                        )
                        
                        Spacer()
                        
                        TextSection(
                            text: "₱\(String(format: "%.2f", getTotal()))",
                            color: ThemeColor.brown
                        )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                    .background(.black)
                    .padding(.horizontal)
                    
                    NavigationLink(destination: CheckoutView()) {
                        Text("Check Out (\(getNumOfSelected()))")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity) // Take up equal space
                            .padding()
                            .background(ThemeColor.green)
                            .onTapGesture {
                                let transaction = Transaction(total: getTotal())
                                transaction.beanCartItems.append(contentsOf: selectedBeanCartItems)
                                transaction.storeCartItems.append(contentsOf: selectedStoreCartItems)
                                
                                Session.shared.loggedInAccount?.transactions.append(transaction)
                                
                                saveContext()
                            }
                    }
                    .disabled(getNumOfSelected() == 0)
                }
                .padding(.bottom, 20)
                
            } // ZStack
        }
        .toolbarBackground(.black, for: .navigationBar)
    }
    
    private func getTotal() -> Double {
        let beanTotal = beanCartItems
            .filter { $0.isSelected == true }
            .reduce(0.0) { runningTotal, item in
                runningTotal + item.totalPrice
            }
        
        let storeTotal = storeCartItems
            .filter { $0.isSelected == true }
            .reduce(0.0) { runningTotal, item in
                runningTotal + item.totalPrice
            }
        
        return beanTotal + storeTotal
    }
    
    private func getNumOfSelected() -> Int {
        let beanCount = beanCartItems.filter {$0.isSelected == true}.count
        let storeCount = storeCartItems.filter {$0.isSelected == true}.count
        
        return beanCount + storeCount
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving transaction: \(error)")
        }
    }
}

struct rowElement: View {
    var name: String
    var total: Double
    
    private let characterLimit = 30

    private var limitedName: String {
        if name.count > characterLimit {
            let endIndex = name.index(name.startIndex, offsetBy: characterLimit)
            return String(name[..<endIndex]) + "..."
        }
        return name
    }
    
    var body: some View {
        HStack {
            TextParagraph(text: limitedName)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Spacer()
            
            TextParagraph(text: String(format: "%.2f", total))
                .lineLimit(1)
        } // HStack
    }
}

#Preview {
    CartView()
}
