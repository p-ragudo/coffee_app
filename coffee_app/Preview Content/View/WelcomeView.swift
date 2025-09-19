import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
//                BACKGROUND IMAGE HERE
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
                
                Spacer()
                
                Text("Brewing Brilliance:")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Your Coffee, Your Way")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 14)
                Text("From coffee farms straight to your home\nchoose a wide variety of beans and more")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
                NavigationLink(
                    destination: SignUpView(),
                    label: {
                        Text("Get Started")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .padding(.vertical, 15)
                            .background(ThemeColor.brown)
                            .cornerRadius(8)
                            .padding(.bottom, 40)
                    }
                )
            } // VStack
            .padding()
            .background(.black) // REMOVE ONCE BACKGROUND IMAGE IS PRESENT
            .edgesIgnoringSafeArea(.all) // REMOVE ONCE BACKGROUND IMAGE IS PRESENT
            
        } // NavigationView
    }
}

#Preview {
    WelcomeView()
}
