import SwiftUI

struct StoreView: View {
    // ADD NAVIGATION TO BEAN TYPES, DISCOVER, AND FARM SPOTLIGHT
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(alignment: .center) {
                    // HEADER IMAGE
                    Image("store_bg")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .padding(.top, 50)
                    
                    // HEADER TITLE AND DESCRIPTION
                    Text("Store")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    Text("""
                         Everything you need to brew the perfect cup
                         From grinders to brewers, espresso machines,\nand more
                         """)
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    
                    Text("Search and Filter Here")
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    Text("Tab Filters")
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    
                    // FIND YOUR FLAVOUR SECTION
                    Text("Exclusive Offers")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    
                    Text("Offers slideshow here")
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    
                    Text("Best Sellers")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    
                    Text("Products slider here")
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    
                    GridBuilderView(items: Controller.storeProducts, columns: 2, content: { product in
                        StoreProductCard(
                            image: product.image,
                            name: product.name,
                            price: product.price,
                            rating: product.rating,
                            numOfSold: product.numOfSold,
                            storeProduct: product
                        )
                    }, hSpacing: 20, vSpacing: 40)
                    
                } // VStack
                
            } // ScrollView
            .background(.black)
            .edgesIgnoringSafeArea(.top)
            
        } // NavigationStack
        .toolbarBackground(.black, for: .navigationBar)
    }
}

#Preview {
    StoreView()
}

