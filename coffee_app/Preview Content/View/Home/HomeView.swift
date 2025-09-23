import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading) {
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
                    
                    Text("Beans")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                    
                    
                    
                } // VStack
                .padding()
                
            } // ScrollView
            .background(.black)
            .edgesIgnoringSafeArea(.top)
            
        } // NavigationStack
    }
}

#Preview {
    HomeView()
}
