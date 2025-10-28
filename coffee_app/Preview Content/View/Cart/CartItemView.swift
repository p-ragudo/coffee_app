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
                    .font(.title)
            }
            
            // Product Image (Placeholder)
            Rectangle()
                .fill(Color.gray)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
                .padding(.trailing)
            
            // Product Name and Price
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Text("P \(String(format: "%.2f", item.price))")
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
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Text("\(item.quantity)")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(8)
                
                Button(action: {
                    cartController.increaseQuantity(for: item)
                }) {
                    Text("+")
                        .frame(width: 30, height: 30)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white, lineWidth: 2)
        )
        .padding(.horizontal)
    }
}
