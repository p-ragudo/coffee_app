import SwiftUI

struct LogInView: View {
    @State var usernameEmail: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack {
                // INSERT IMAGE HERE
                
                VStack {
                    Spacer()
                    
                    Text("Log In")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(40)
                    
                    CustomTextField(
                        text: $usernameEmail,
                        hintText: "Email / Username",
                        icon: Image(systemName: "person.fill"))
                        .padding(.bottom, 8)
                    CustomTextField(
                        text: $password,
                        hintText: "Password",
                        icon: Image(systemName: "lock.fill"), iconTextPadding: 20)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Text("Don't have an account? ")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                        
                        NavigationLink(
                            destination: SignUpView(),
                            label: {
                                Text("Sign Up")
                                    .foregroundStyle(.blue)
                                    .font(.subheadline)
                            }
                        )
                    }
                    .padding(.bottom, 40)
                    
                    NavigationLink(
                        destination: LogInView(),
                        label: {
                            Text("Log In")
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                                .padding(.vertical, 15)
                                .background(ThemeColor.brown)
                                .cornerRadius(8)
                                .padding(.bottom, 40)
                        }
                    )
                    
                } // VStack
            } // ZStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.black) // REMOVE ONCE BACKGROUND IMAGE IS PRESENT
            .edgesIgnoringSafeArea(.all) // REMOVE ONCE BACKGROUND IMAGE IS PRESENT
        } // NavigationStack
    }
}

#Preview {
    LogInView()
}
