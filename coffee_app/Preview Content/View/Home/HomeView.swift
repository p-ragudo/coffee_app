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
                
                VStack {
                    Text("Beans")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                    
                    GridBuilderView(items: controller.beanTypes) { beanType in
                        ProductFeatureCard(
                            name: beanType.name,
                            desc: beanType.desc,
                            popularity: beanType.popularity,
                            rating: beanType.rating,
                            navigateTo: beanType.navigateTo
                        )
                    }
                    .frame(maxHeight: .infinity)
                    
                } // VStack
                
            } // ScrollView
            .background(.black)
            .edgesIgnoringSafeArea(.top)
            
        } // NavigationStack
    }
}

#Preview {
    var controller = Controller()
    HomeView(controller: controller)
}
