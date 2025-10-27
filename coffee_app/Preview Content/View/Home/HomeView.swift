import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                // HEADER
                ZStack(alignment: .topLeading) {
                    
                    Image("home_bg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                    
                    VStack {
                        Text("Coffee App")
                            .font(.system(size: 40, weight: .semibold, design: .serif))
                            .foregroundStyle(.white)
                        Text("Philippine Coffee Beans")
                            .font(.system(size: 18, weight: .medium, design: .serif))
                            .foregroundStyle(.white)
                    }
                    .padding(.top, 220)
                    .padding(.horizontal)
                    
                } // ZStack
                .padding(.bottom, 20)
                
                VStack {
                    // BEANS SECTION
                    Text("Beans")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Choose from our collection")
                        .font(.system(size: 15, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    GridBuilderView(items: Controller.beanTypes, columns: 2, content: { beanType in
                        BeanTypeCard(
                            image: beanType.image,
                            name: beanType.name,
                            desc: beanType.desc,
                            popularity: beanType.popularity,
                            rating: beanType.rating,
                            beanType: beanType
                        )
                    }, hSpacing: 16, vSpacing: 30)
                    .padding(.bottom, 40)
                    
                    MoreButton(navigateTo: AnyView(BeansView()))
                        .padding(.bottom, 50)
                    
                    
                    // FARMS SECTION
                    Text("Farms")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                    Text("Our partner local farms")
                        .font(.system(size: 15, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    
                    Image("farm_card")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 10)
                        
                    Text("Our partner local farms")
                        .font(.system(size: 16, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    
                    // REPLACE NAVIGATION DESTINATION
                    MoreButton(navigateTo: AnyView(WelcomeView()))
                        .padding(.bottom, 50)
                    
                    
                    // STORE SECTION
                    Text("Store")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                    Text("Accessories and Machinery\nfor your brewing needs")
                        .font(.system(size: 15, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    
                    Image("store_bg")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 15)
                    
                    Text("All you need for a\ngood cup of coffee")
                        .font(.system(size: 15, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 15)
                    
                    GridBuilderView(items: Controller.storeProductTypes, columns: 2, content: { product in
                        ProductTypeCard(
                            image: product.image,
                            name: product.name,
                            desc: product.desc,
                            type: product.type,
                            navigateTo: product.navigateTo
                        )
                    }, hSpacing: 16, vSpacing: 30)
                    .padding(.bottom, 40)
                    
                    MoreButton(navigateTo: AnyView(StoreView()))
                        .padding(.bottom, 80)
                    
                    // FOOTER
                    Image("footer_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    
                    Text("Fresh local beans\nDelivered straight to you")
                        .font(.system(size: 15, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 15)
                    
                } // VStack
                
            } // ScrollView
            .background(.black)
            .edgesIgnoringSafeArea(.top)
            
        } // NavigationStack
        .navigationBarHidden(true)
    }
}

struct MoreButton: View {
    var navigateTo: AnyView
    
    var body: some View {
        NavigationLink(destination: navigateTo) {
            Text("More")
                .font(.system(size: 18, design: .serif))
                .foregroundStyle(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(ThemeColor.green)
                .cornerRadius(4)
        }
    }
}

#Preview {
    HomeView()
}
