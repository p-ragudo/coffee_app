import SwiftUI

struct FarmCard: View {
    var farm: Farm
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Image("farm_card")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
            
                HStack {
                    VStack {
                        TextSection(
                            text: farm.name,
                            size: 18,
                            color: .black
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        TextParagraph(
                            text: farm.location,
                            color: .gray
                        )
                    } // VStack
                } // HStack
                
            } // VStack
        } // NavigationStack
    }
}

#Preview {
    FarmCard(farm: Farm(name: "Test Farm", location: "Test Location", ratings: 4.7, image: "farm_card"))
}
