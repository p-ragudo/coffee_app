import SwiftUI

struct BeansView: View {
    // ADD NAVIGATION TO BEAN TYPES, DISCOVER, AND FARM SPOTLIGHT
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack {
                    // HEADER IMAGE
                    Image("beans_header")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .padding(.top, 50)
                    
                    // HEADER TITLE AND DESCRIPTION
                    Text("Beans")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    Text("""
                         Philippine coffee farms grow all four bean types-- Arabica, Robusta, Liberica (Barako), and Excelsa. From cool mountain highlands to farms, they produce unique flavors rooted in tradition and region
                         """)
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 40)
                    
                    // FIND YOUR FLAVOUR SECTION
                    Text("Find Your Flavour")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    
                    GridBuilderView(items: Controller.beanTypes, columns: 2, content: { beanType in
                        BeanTypeView(text: beanType.name)
                    }, hSpacing: 16, vSpacing: 13)
                    .padding(.bottom, 40)
                    
                    // DISCOVER SECTION
                    Text("Discover")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    Image("beans_sale")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .padding(.bottom, 40)
                    
                    // FARM SPOTLIGHTS SECTION
                    Text("Farm Spotlights")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    Image("farm_card")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 40)
                    
                    // EXPLORE SECTION
                    Text("Explore")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    // GRID BUILDER
                    GridBuilderView(items: Controller.beanProducts, columns: 2, content: { beanProduct in
                        BeanProductCard(
                            image: beanProduct.image,
                            name: beanProduct.name,
                            price: beanProduct.price,
                            rating: beanProduct.rating,
                            numOfSold: beanProduct.numOfSold,
                            navigateTo: beanProduct.navigateTo

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
    BeansView()
}
