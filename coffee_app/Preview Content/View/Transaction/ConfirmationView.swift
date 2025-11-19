import SwiftUI
import SwiftData

struct ConfirmationView: View {
    let transaction: Transaction
    let beanCartItems: [BeanCartItem]
    let storeCartItems: [StoreCartItem]
    
    init() {
        // Make sure `transaction` is safely unwrapped
        guard let lastTransaction = Session.shared.loggedInAccount?.transactions.last else {
            // Handle error case if no transaction is available
            fatalError("No transactions available.")
        }
        
        transaction = lastTransaction
        beanCartItems = transaction.beanCartItems
        storeCartItems = transaction.storeCartItems
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                ScrollView {
                    Image(systemName: "checkmark.circle.fill") // Placeholder image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                                        
                    Text("Successful Purchase!")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .padding(.bottom, 40)
                    
                    TextSection(text: "Order Summary")
                        .padding(.bottom)
                    
                    Group {
                        ForEach(beanCartItems, id: \.name) { item in
                            confirmationRowElement(name: item.name, total: item.totalPrice, beanCartItem: item)
                                .padding(.bottom, 3)
                        }
                        ForEach(storeCartItems, id: \.name) { item in
                            confirmationRowElement(name: item.name, total: item.totalPrice, storeCartItem: item)
                        }
                    }
                    .background(.black)
                    .padding(.horizontal)
                } // ScrollView
                .background(Color.black)
        
                
            } // ZStack
        }
        .toolbarBackground(.black, for: .navigationBar)
    }
}

struct confirmationRowElement: View {
    var name: String
    var total: Double
    var beanCartItem: BeanCartItem? = nil
    var storeCartItem: StoreCartItem? = nil
    
    
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
            
            TextParagraph(text: "x ")
            TextParagraph(text: beanCartItem == nil ? "" : "\(beanCartItem!.quantity)")
            TextParagraph(text: storeCartItem == nil ? "" : "\(storeCartItem!.quantity)")
                .padding(.trailing, 3)
            
            TextParagraph(text: String(format: "%.2f", total))
                .lineLimit(1)
        } // HStack
    }
}

#Preview {
//    ConfirmationView()
}
