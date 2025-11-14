import SwiftUI

struct FarmView: View {
    var farm: Farm
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                Image(farm.image)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .padding(.top, 50)
                
                VStack {
                    TextPageTitle(text: farm.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 1)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .font(.system(size: 14))
                            .padding(.trailing, 5)
                        
                        TextParagraph(
                            text: "\(farm.ratings) / 5",
                            color: ThemeColor.green
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    } // HStack
                    .padding(.bottom, 10)
                    
                    TextParagraph(
                        text: farm.location,
                        color: .gray
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                    
                    TextSection(text: "Description")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 1)
                    
                    TextParagraph(text: farm.desc)
                        .padding(.bottom, 40)
                    
                    TextSection(text: "Best Sellers")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                
                ImageSliderView(items: Controller.beanProducts, automaticScrolling: true, content: { beanProduct in
                    BeanProductCard(
                        image: beanProduct.image,
                        name: beanProduct.name,
                        price: beanProduct.price,
                        rating: beanProduct.rating,
                        numOfSold: beanProduct.numOfSold,
                        beanProduct: beanProduct,
                        imageScale: 0.7
                    )
                }, hSpacing: 20)
                .padding(.bottom, 40)
                
                TextSection(text: "Special Offers")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Image("beans_sale")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .padding(.bottom, 40)
                
                TextSection(text: "Discover")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
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
                .padding(.bottom, 80)
                
            } // ScrollView
            .background(.black)
            .edgesIgnoringSafeArea(.top)
            
        } // NavigationStack
        .toolbarBackground(.black, for: .navigationBar)
    }
}

#Preview {
    FarmView(farm: Controller.farms.first!)
}
