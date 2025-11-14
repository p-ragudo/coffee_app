import SwiftUI

struct FarmCard: View {
    var farm: Farm
    
    var body: some View {
        NavigationLink(destination: FloatingTabBarView(selectedTab: Tab.farms)) {
            VStack {
                
                Image("farm_card")
                    .resizable()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .scaledToFit()
                    .clipped()
            
                HStack {
                    VStack {
                        TextSection(
                            text: farm.name,
                            size: 18
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 1)
                        
                        TextParagraph(
                            text: farm.location,
                            color: .gray
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    } // VStack
                    
                    Spacer()
                    
                    HStack {
                        TextParagraph(
                            text: "Rating:",
                            color: .blue
                        )
                        .padding(.trailing, 5)
                        
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .font(.system(size: 14))
                        
                        TextParagraph(
                            text: "\(farm.ratings) / 5",
                            color: ThemeColor.green
                        )
                    } // HStack
                    
                } // HStack
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                NavigationLink(destination: FloatingTabBarView(selectedTab: Tab.farms)) {
                    TextParagraph(text: "View Products")
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(ThemeColor.green)
                        .cornerRadius(5)
                        .padding(.horizontal)
                }
                
            } // VStack
        } // NavigationStack
    }
}

#Preview {
    FarmCard(farm: Controller.farms.first!)
}
