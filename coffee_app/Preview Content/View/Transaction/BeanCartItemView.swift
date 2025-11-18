import SwiftUI

struct BeanCartItemView: View {
    @Environment(\.modelContext) var context
    
    var item: BeanCartItem
    
    var body: some View {
        HStack {
            // Checkbox for selection
            Button(action: {
                if item.isSelected {
                    item.isSelected = false
                } else {
                    item.isSelected = true
                }
            }) {
                Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isSelected ? .green : .gray)
                    .font(.title2)
            }
            
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
                
                // Quantity Controls
                HStack {
                    Button(action: {
                        if item.quantity <= 1 {
                            item.quantity = 1
                        } else {
                            item.quantity -= 1
                        }
                        item.totalPrice = item.price * Double(item.quantity)
                        
                        do {
                            try context.save()
                        } catch {
                            print("Error saving context: \(error)")
                        }
                    }) {
                        Text("-")
                            .foregroundColor(.white)
                            .padding(.trailing, 5)
                    }
                    
                    Text("\(item.quantity)")
                        .foregroundColor(.white)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 3)
                        .background(ThemeColor.green)
                        .cornerRadius(8)
                    
                    Button(action: {
                        item.quantity += 1
                        item.totalPrice = item.price * Double(item.quantity)
                        
                        do {
                            try context.save()
                        } catch {
                            print("Error saving context: \(error)")
                        }
                    }) {
                        Text("+")
                            .foregroundColor(.white)
                            .padding(.leading, 5)
                    }
                } // HStack
                .padding(.bottom, 10)
                
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
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 15)
        .padding(.horizontal, 5)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white, lineWidth: 0.8)
        )
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        BeanCartItemView(item: BeanCartItem(
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
