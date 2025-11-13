import SwiftUI

struct BeanTypeCard: View {
    var image: String
    var name: String
    var desc: String
    var popularity: String
    var rating: Double
    var beanType: BeanType
    
    init(image: String,
         name: String,
         desc: String,
         popularity: String,
         rating: Double,
         beanType: BeanType
    ) {
        self.image = image
        self.name = name
        self.desc = desc
        self.popularity = popularity
        self.rating = rating
        self.beanType = beanType
    }
    
    var body: some View {
        NavigationLink(destination: FloatingTabBarView(selectedTab: 1, customBeanType: beanType)) {
            VStack(alignment: .leading){
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 170)
                
                Text(name)
                    .font(.system(size: 30, weight: .medium, design: .serif))
                    .foregroundStyle(.white)
                
                Text(desc)
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.white)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.leading)
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
    BeanTypeCard(
        image: "bean_card",
        name: "Arabica",
        desc: "Sweet and classic, perfect for every taste",
        popularity: "Popularity",
        rating: 1,
        beanType: Controller.beanTypes.first!
    )
}
