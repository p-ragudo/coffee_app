import SwiftUI

struct BeansTypeView: View {
    var beanType: BeanType
    
    init(beanType: BeanType) {
        self.beanType = beanType
    }
    
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
                    HStack {
                        VStack {
                            Text(beanType.name)
                                .font(.system(size: 30, weight: .semibold, design: .serif))
                                .foregroundStyle(.white)
                                .padding(.top, 5)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack {
                                Text(beanType.popularity)
                                    .font(.system(size: 14, weight: .regular, design: .serif))
                                    .foregroundStyle(ThemeColor.green)
                                    .padding(.leading)
                                    .padding(.bottom, 5)
                                    .padding(.trailing, 5)
                                Text(String(format: "%.2f", beanType.rating))
                                    .font(.system(size: 14, weight: .regular, design: .serif))
                                    .foregroundStyle(ThemeColor.brown)
                                    .padding(.bottom, 5)
                            } // HStack
                            .frame(maxWidth: .infinity, alignment: .leading)
                        } // VStack
                        
                        HStack {
                            Text("Add to favourites")
                                .font(.system(size: 14, weight: .regular, design: .serif))
                                .foregroundStyle(.blue)
                                .padding(.trailing, 5)
                            Image(systemName: "star")
                                .foregroundStyle(.yellow)
                                .font(.system(size: 14))
                                .padding(.trailing)
                        } // HStack
                    } // HStack
                    .padding(.bottom, 14)
                    
                    
                    Text("Description")
                        .font(.system(size: 16, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 3)
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
                    
                    Text("Search and Filter Here")
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 40)
                    
                    Text("2 Tabs Here")
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 40)
                    
                    // RECOMMENDED FOR YOU
                    Text("Recommended For You")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    ImageSliderView(items: Controller.beanProducts, automaticScrolling: false, content: { beanProduct in
                        BeanProductCard(
                            image: beanProduct.image,
                            name: beanProduct.name,
                            price: beanProduct.price,
                            rating: beanProduct.rating,
                            numOfSold: beanProduct.numOfSold,
                            beanProduct: beanProduct
                        )
                    }, hSpacing: 20)
                    
                    // BROWSE SECTION
                    Text("Browse")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    
                    GridBuilderView(items: Controller.beanProducts, columns: 2, content: { beanProduct in
                        BeanProductCard(
                            image: beanProduct.image,
                            name: beanProduct.name,
                            price: beanProduct.price,
                            rating: beanProduct.rating,
                            numOfSold: beanProduct.numOfSold,
                            beanProduct: beanProduct

                        )
                    }, hSpacing: 20, vSpacing: 40)
                    .padding(.bottom, 40)
                    
                    // YOU MIGHT LIKE
                    Text("You Might Like")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    Text("Slideshow Images Here")
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 40)
                    
                    // MORE SECTION
                    Text("More")
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
                            beanProduct: beanProduct

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
    BeansTypeView(beanType: Controller.beanTypes.first!)
}
