import SwiftUI

struct ProductView: View {
    var beanProduct: BeanProduct
    
    // ADD ROAST TYPE FOR PRODUCT IN MODEL. THIS IS A PLACEHOLDER
    let roastTypes = ["Light Roast", "Medium Roast", "Medium-Dark Roast", "Dark Roast"]
    
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
                    // INSERT ROAST TYPES
                    
                    
                    Text("Sizes")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    // INSERT SIZES
                    
                    // INSERT FARM HERE
                    
                    Text("Description")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    
                    Text("You Might Like")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    // THIS IS A PLACEHOLDER FOR THE SLIDER
                    GridBuilderView(items: Controller.beanProducts, content: { product in
                        BeanProductCard(
                            image: product.image,
                            name: product.name,
                            price: product.price,
                            rating: product.rating,
                            numOfSold: product.numOfSold,
                            navigateTo: product.navigateTo
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
