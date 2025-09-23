import SwiftUI

struct ProductFeatureCard: View {
    var name: String
    var desc: String
    var popularity: String
    var rating: Int
    var navigateTo: any View
    
    init(name: String, desc: String, popularity: String, rating: Int, navigateTo: any View) {
        self.name = name
        self.desc = desc
        self.popularity = popularity
        self.rating = rating
        self.navigateTo = navigateTo
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Image("bean_card")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 161, height: 201)
            
            Text(name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(desc)
                .font(.subheadline)
                .fontWeight(.regular)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 12)
            
            HStack{
                Text(popularity)
                    .font(.caption)
                    .foregroundStyle(.green) // change to the palette color in figma prototype
                
                Spacer()
                
                Text(String(rating))
                    .font(.caption2)
                    .foregroundStyle(.brown) // change to the palette color in figma prototype
            }
        }//VStack
        .frame(width: 161, height: 299)
    }
}

#Preview {
    ProductFeatureCard(
        name: "Arabica",
        desc: "Sweet and classic, perfect for every taste",
        popularity: "Popularity",
        rating: 1,
        navigateTo: WelcomeView()
    )
}
