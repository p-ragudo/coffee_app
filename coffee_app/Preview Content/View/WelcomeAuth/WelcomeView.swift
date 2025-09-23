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
                    .font(.system(size: 32, weight: .medium, design: .serif))
                Text("Your Coffee, Your Way")
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .medium, design: .serif))
                    .padding(.bottom, 14)
                Text("From coffee farms straight to your home\nchoose a wide variety of beans and more")
                    .font(.system(size: 18, weight: .regular, design: .serif))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
                NavigationLink(
                    destination: SignUpView(),
                    label: {
                        Text("Get Started")
                            .font(.system(size: 18, weight: .regular, design: .serif))
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
