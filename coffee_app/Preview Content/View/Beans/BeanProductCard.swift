
import SwiftUI

struct BeanProductCard: View {
    var image: String
    var name: String
    var price: Double
    var rating: Double
    var numOfSold: Int
    var navigateTo: AnyView
    
    init(image: String,
         name: String,
         price: Double,
         rating: Double,
         numOfSold: Int,
         navigateTo: AnyView
    ) {
        self.image = image
        self.name = name
        self.price = price
        self.rating = rating
        self.numOfSold = numOfSold
        self.navigateTo = navigateTo
    }
    
    var body: some View {
        NavigationLink(destination: navigateTo) {
            VStack(alignment: .leading){
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 170)
                
                Text(name)
                    .font(.system(size: 15, weight: .medium, design: .serif))
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 2)
            
                Text("₱ \(String(format: "%.2f", price))")
                    .font(.system(size: 22, weight: .semibold, design: .serif))
                    .foregroundStyle(ThemeColor.brown)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 2)
                
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.system(size: 11))
                    Text(String(format: "%.1f", rating))
                        .font(.caption)
                        .foregroundStyle(ThemeColor.green)
                    
                    Spacer()
                    
                    Text("\(formatAsK(number: numOfSold)) sold")
                        .font(.caption2)
                        .foregroundStyle(.blue)
                }
            }//VStack
            .frame(width: 170)
        } // NavigationLink
    }
    
    func formatAsK(number: Int) -> String {
        if number >= 1000 {
            let formattedNumber = Double(number) / 1000
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 1 // One decimal place for numbers like 1.5k
            formatter.minimumFractionDigits = 0 // No decimal for whole numbers like 2k
            formatter.numberStyle = .decimal
            return "\(formatter.string(from: NSNumber(value: formattedNumber)) ?? "")k"
        } else {
            return "\(number)"
        }
    }
}

#Preview {
    BeanProductCard(
        image: "arabica_card",
        name: "Bean product name goes here in this card",
        price: 600,
        rating: 1,
        numOfSold: 2345,
        navigateTo: AnyView(WelcomeView())
    )
}
