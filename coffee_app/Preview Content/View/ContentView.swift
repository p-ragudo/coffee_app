 import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Spacer()
                
                Text("Brewing Brilliance:")
                Text("Your Coffee, Your Way")
                Text("From coffee farms straight to your home\nchoose a wide variety of beans and more")
                    .multilineTextAlignment(.center)
                
                NavigationLink(
                    destination: LoginScreen(),
                    label: {
                        Text("Get Started")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .padding(.vertical, 15)
                            .background(Color.brown)
                            .cornerRadius(8)
                    }
                )
            } // VStack
            .padding()
        } // NavigationView
    }
}

#Preview {
    ContentView()
}


struct LoginScreen: View {
    var body: some View {
        Text("Login Screen")
    }
}
