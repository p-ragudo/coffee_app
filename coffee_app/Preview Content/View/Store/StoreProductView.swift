import SwiftUI
import Foundation

struct StoreProductView: View {
    var storeProduct: StoreProduct
    
    init(storeProduct: StoreProduct) {
        self.storeProduct = storeProduct
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image("store_bg")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .padding(.top, 50)
                    
                    HStack {
                        Text(storeProduct.name)
                            .font(.system(size: 24, weight: .semibold, design: .serif))
                            .foregroundStyle(.white)
                        Spacer()
                        Image(systemName: "heart")
                            .foregroundStyle(.red)
                            .font(.system(size: 20))
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .font(.system(size: 12))
                        Text("\(String(format: "%.1f", storeProduct.rating)) / 5")
                            .font(.system(size: 14, weight: .light, design: .serif))
                            .foregroundStyle(ThemeColor.green)
                            .padding(.trailing, 15)
                        Text("\(Utils.formatAsK(number: storeProduct.numOfSold))+ sold")
                            .font(.system(size: 14, weight: .light, design: .serif))
                            .foregroundStyle(.blue)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 2)
                    
                    Text("₱ \(String(format: "%.2f", storeProduct.price))")
                        .font(.system(size: 28, weight: .semibold, design: .serif))
                        .foregroundStyle(ThemeColor.brown)
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    
                    
                    // INSERT FARM HERE
                    
                    Divider()
                        .background(.white)
                        .padding(.bottom, 30)
                        .padding(.horizontal)
                    
                    Text("Description")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.bottom, 15)
                    Text(
                        """
                        This is where the description of the farm or shop goes. This is where they will describe all about their farm, the products they produce, or whatever they may be inclined to put in this section
                        
                        Additional things to say or describe a product will be here. It will be up to the shop or farm to decide what descriptions and product specifications they will include. Just that this section is for that purpose
                        
                        One last paragraph to demonstrate this section of the page. This is where descriptions will go about the product. More may be said depending on the farm and the descriptions and information they include. It is up to them.
                        """
                    )
                        .font(.system(size: 14, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 40)
                    
                    Divider()
                        .background(.white)
                        .padding(.bottom, 40)
                        .padding(.horizontal)
                    
                    Text("You Might Like")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    // THIS IS A PLACEHOLDER FOR THE SLIDER
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
                    
                } // Vstack
            } // ScrollView
            .background(.black)
            .edgesIgnoringSafeArea(.top)
            
        } // NavigationStack
        .toolbarBackground(.black, for: .navigationBar)
    }
}

#Preview {
    StoreProductView(storeProduct: Controller.storeProducts.first!)
}

