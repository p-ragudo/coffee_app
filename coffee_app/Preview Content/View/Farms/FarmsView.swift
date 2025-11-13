import SwiftUI

struct FarmsView: View {
    // ADD NAVIGATION TO BEAN TYPES, DISCOVER, AND FARM SPOTLIGHT
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack {
                    // HEADER IMAGE
                    Image("farm_bg")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .padding(.top, 50)
                    
                    TextHeader(text: "Farms")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    
                    TextParagraph(text:
                    """
                    Philippine coffee farms grow all four bean types: Arabica, Robusta, Liberica (Barako), and Excelsa. From cool mountain highlands to farms, they produce unique flavors rooted in tradition and region.
                    """
                    )
                    .padding(.bottom, 40)
                    
                    TextSection(text: "Discover")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    // MAKE FARM CARD
                    Image("farm_card")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                    
                } // VStack
                
            } // ScrollView
            .background(.black)
            .edgesIgnoringSafeArea(.top)
            
        } // NavigationStack
        .toolbarBackground(.black, for: .navigationBar)
    }
}

#Preview {
    FarmsView()
}

