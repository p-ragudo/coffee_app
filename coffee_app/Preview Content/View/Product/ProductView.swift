import SwiftUI
import Foundation

// THIS IS A PLACEHOLDER
struct Size: Identifiable {
    var id = UUID()
    var size: String
}

struct ProductView: View {
    var beanProduct: BeanProduct
    
    // ADD ROAST TYPE FOR PRODUCT IN MODEL. THIS IS A PLACEHOLDER
    let roastTypes = [
        RoastType(type: "Light Roast"),
        RoastType(type: "Medium Roast"),
        RoastType(type: "Medium-Dark Roast"),
        RoastType(type: "Dark Roast")
    ]
    
    // PLACEHOLDER ARRAY FOR SIZES, FOR DISPLAYING CONTENT
    let sizes = [
        Size(size: "100g (3.5oz)"),
        Size(size: "250g (8.8oz)"),
        Size(size: "500g (17.6oz)"),
        Size(size: "1kg (2.2 lbs)"),
        Size(size: "2.5kg (5.5 lbs)"),
    ]
    
    init(beanProduct: BeanProduct) {
        self.beanProduct = beanProduct
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image("bean_product")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .padding(.top, 50)
                    
                    HStack {
                        Text(beanProduct.name)
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
                        Text("\(String(format: "%.1f", beanProduct.rating)) / 5")
                            .font(.system(size: 14, weight: .light, design: .serif))
                            .foregroundStyle(ThemeColor.green)
                            .padding(.trailing, 15)
                        Text("\(Utils.formatAsK(number: beanProduct.numOfSold))+ sold")
                            .font(.system(size: 14, weight: .light, design: .serif))
                            .foregroundStyle(.blue)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 2)
                    
                    Text("₱ \(String(format: "%.2f", beanProduct.price))")
                        .font(.system(size: 28, weight: .semibold, design: .serif))
                        .foregroundStyle(ThemeColor.brown)
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    
                    Text("Available Roast Types")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    // ROAST TYPES WITH PLACEHOLDER VALUES (SEE TOP)
                    GridBuilderView(items: roastTypes, columns: 2, content: { roastType in
                        WhiteBorderButton(
                            text: roastType.type,
                            width: 180
                        )
                    }, hSpacing: 5, vSpacing: 8)
                    .padding(.bottom, 25)
                    
                    Text("Sizes")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    // SIZES WITH PLACEHOLDER VALUES (SEE TOP)
                    GridBuilderView(items: sizes, columns: 3, content: { size in
                        WhiteBorderButton(
                            text: size.size,
                            width: 115
                        )
                    }, hSpacing: 0, vSpacing: 10)
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
                    GridBuilderView(items: Controller.beanProducts, columns: 2, content: { product in
                        BeanProductCard(
                            image: product.image,
                            name: product.name,
                            price: product.price,
                            rating: product.rating,
                            numOfSold: product.numOfSold,
                            beanProduct: product
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
    ProductView(beanProduct: Controller.beanProducts.first!)
}
