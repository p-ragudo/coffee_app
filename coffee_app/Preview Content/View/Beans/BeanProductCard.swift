
import SwiftUI

struct BeanProductCard: View {
    var image: String
    var name: String
    var price: Double
    var popularity: String
    var rating: Double
    var navigateTo: AnyView
    
    init(image: String,
         name: String,
         price: Double,
         popularity: String,
         rating: Double,
         navigateTo: AnyView
    ) {
        self.image = image
        self.name = name
        self.price = price
        self.popularity = popularity
        self.rating = rating
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
                    .font(.system(size: 17, weight: .semibold, design: .serif))
                    .foregroundStyle(.black)
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
                    Text(popularity)
                        .font(.caption)
                        .foregroundStyle(ThemeColor.green)
                    
                    Spacer()
                    
                    Text(String(rating))
                        .font(.caption2)
                        .foregroundStyle(ThemeColor.brown)
                }
            }//VStack
            .frame(width: 170)
        } // NavigationLink
    }
}

#Preview {
    BeanProductCard(
        image: "arabica_card",
        name: "Bean product name goes here in this card",
        price: 600,
        popularity: "Popularity",
        rating: 1,
        navigateTo: AnyView(WelcomeView())
    )
}
