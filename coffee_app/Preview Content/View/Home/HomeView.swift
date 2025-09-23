import SwiftUI

struct HomeView: View {
    var controller: Controller
    
    var body: some View {
        NavigationStack {
            ScrollView{
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
                    Text("Beans")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Choose from our collection")
                        .font(.system(size: 16, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ProductGridBuilderView(items: controller.beanTypes) { beanType in
                        ProductFeatureCard(
                            image: beanType.image,
                            name: beanType.name,
                            desc: beanType.desc,
                            popularity: beanType.popularity,
                            rating: beanType.rating,
                            navigateTo: beanType.navigateTo
                        )
                    }
                    .padding(.bottom, 40)
                    
                    MoreButton(navigateTo: AnyView(WelcomeView()))
                    
                } // VStack
                
            } // ScrollView
            .background(.black)
            .edgesIgnoringSafeArea(.top)
            
        } // NavigationStack
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
    var controller = Controller()
    HomeView(controller: controller)
}
