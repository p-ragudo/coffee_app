import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ZStack(alignment: .topLeading) {
                        
                        Image("home_bg")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .edgesIgnoringSafeArea(.all)
                        
                        Text("Coffee App")
                            .font(.system(size: 40, weight: .semibold, design: .serif))
                            .foregroundStyle(.white)
                            .offset(x: 16, y: 260)
                        Text("Philippine Coffee Beans")
                            .font(.system(size: 40, weight: .semibold, design: .serif))
                            .foregroundStyle(.white)
                            .offset(x: 16, y: 300)
                        
                    } // ZStack
                    
                } // VStack
                .padding()
                
            } // ScrollView
            .background(.black)
            .edgesIgnoringSafeArea(.all)
            
        } // NavigationStack
    }
}

#Preview {
    HomeView()
}
