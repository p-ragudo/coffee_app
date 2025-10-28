import SwiftUI

struct CartItemView: View {
    @ObservedObject var cartController: CartController
    var item: CartItem
    
    var body: some View {
        HStack {
            // Checkbox for selection
            Button(action: {
                cartController.toggleSelection(for: item)
            }) {
                Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isSelected ? .green : .gray)
                    .font(.title2)
            }
            
            // Product Image (Placeholder)
            Image(item.image) // Use item.image for the actual product image
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            // Product Name and Price
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Text("₱ \(String(format: "%.2f", item.price))")
                    .font(.subheadline)
                    .foregroundColor(.orange)
            }
            
            Spacer()
            
            // Quantity Controls
            HStack {
                Button(action: {
                    cartController.decreaseQuantity(for: item)
                }) {
                    Text("-")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Text("\(item.quantity)")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .background(ThemeColor.green)
                    .cornerRadius(8)
                
                Button(action: {
                    cartController.increaseQuantity(for: item)
                }) {
                    Text("+")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding(.vertical)
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
        CartItemView(cartController: CartController(), item: CartItem(name: "Dark Roast Coffee", price: 200, image: "arabica_card", quantity: 2, isSelected: false))
            .previewLayout(.sizeThatFits)
            .padding(.horizontal)
            .background(Color.black)
    }
}
