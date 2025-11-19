import SwiftUI

struct CheckoutStoreCartItemView: View {
    @Environment(\.modelContext) var context
    
    var item: StoreCartItem
    
    var body: some View {
        HStack {
            // Product Image (Placeholder)
            Image(item.image) // Use item.image for the actual product image
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 100)
                .cornerRadius(8)
            
            // Product Name and Price
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Text("₱ \(String(format: "%.2f", item.totalPrice))")
                    .font(.system(size: 18).bold())
                    .foregroundColor(ThemeColor.brown)

            } // VStack
            
            Spacer()
            
            TextParagraph(
                text: "x \(item.quantity)",
                size: 16
            )
            .padding(.trailing)
            
        } // HStack
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 15)
        .padding(.horizontal, 5)
    }
}

struct CheckoutStoreCartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutStoreCartItemView(item: StoreCartItem(
            name: "Store name ooga booga hehe",
            price: 576.78,
            totalPrice: 576.78,
            image: "arabica_card",
            quantity: 1,
            isSelected: false
        ))
            .previewLayout(.sizeThatFits)
            .padding(.horizontal)
            .background(Color.black)
    }
}
