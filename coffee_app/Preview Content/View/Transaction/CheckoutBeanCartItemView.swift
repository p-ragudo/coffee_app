import SwiftUI

struct CheckoutBeanCartItemView: View {
    @Environment(\.modelContext) var context
    
    var item: BeanCartItem
    
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
                      
                HStack {
                    TextParagraph(
                        text: item.roastType,
                        color: .gray
                    )
                    .padding(.trailing)
                    
                    TextParagraph(
                        text: "Size: \(item.size)",
                        color: .gray
                    )
                } // HStack

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

struct CheckoutCartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutBeanCartItemView(item: BeanCartItem(
            name: "Dark Roast Coffee",
            price: 200,
            totalPrice: 200,
            image: "arabica_card",
            quantity: 2,
            roastType: "Light Roast",
            size: "12oz",
            isSelected: false
        ))
            .previewLayout(.sizeThatFits)
            .padding(.horizontal)
            .background(Color.black)
    }
}
