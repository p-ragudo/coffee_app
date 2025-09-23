import SwiftUI

struct ProductFeatureCard: View {
    var image: String
    var name: String
    var desc: String
    var popularity: String
    var rating: Double
    var navigateTo: AnyView
    
    init(image: String,
         name: String,
         desc: String,
         popularity: String,
         rating: Double,
         navigateTo: AnyView) {
        self.image = image
        self.name = name
        self.desc = desc
        self.popularity = popularity
        self.rating = rating
        self.navigateTo = navigateTo
    }
    
    var body: some View {
        NavigationLink(destination: navigateTo) {
            VStack(alignment: .leading){
                Image("bean_card")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 170)
                
                Text(name)
                    .font(.system(size: 30, weight: .medium, design: .serif))
                    .foregroundStyle(.black)
                
                Text(desc)
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.black)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 12)
                
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
    ProductFeatureCard(
        image: "bean_card",
        name: "Arabica",
        desc: "Sweet and classic, perfect for every taste",
        popularity: "Popularity",
        rating: 1,
        navigateTo: AnyView(WelcomeView())
    )
}
