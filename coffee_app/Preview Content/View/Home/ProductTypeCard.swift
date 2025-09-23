import SwiftUI

struct ProductTypeCard: View {
    var id = UUID()
    var image: String
    var name: String
    var desc: String
    var type: String
    var navigateTo: AnyView
    
    init(image: String,
         name: String,
         desc: String,
         type: String,
         navigateTo: AnyView
    ) {
        self.image = image
        self.name = name
        self.desc = desc
        self.type = type
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
                    .font(.system(size: 30, weight: .medium, design: .serif))
                    .foregroundStyle(.white)
                
                Text(desc)
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 12)
                
                Text(type)
                    .font(.caption)
                    .foregroundStyle(ThemeColor.green)
            }//VStack
            .frame(width: 170)
        } // NavigationLink
    }
}

#Preview {
    ProductTypeCard(
        image: "store_card",
        name: "Grinders",
        desc: "Moka pots, French presses, Pour-over, and more!",
        type: "Accessories",
        navigateTo: AnyView(WelcomeView())
    )
}
