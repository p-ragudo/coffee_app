import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack {
                // INSERT IMAGE HERE
                
                VStack {
                    Spacer()
                    
                    Text("Create an Account")
                        .font(.system(size: 32, weight: .medium, design: .serif))
                        .foregroundStyle(.white)
                        .padding(40)
                    
                    AuthTextField(
                        text: $username,
                        hintText: "Username",
                        icon: Image(systemName: "person.fill"))
                        .padding(.bottom, 8)
                    AuthTextField(
                        text: $email,
                        hintText: "Email",
                        icon: Image(systemName: "envelope.fill"))
                        .padding(.bottom, 8)
                    AuthTextField(
                        text: $password,
                        hintText: "Password",
                        icon: Image(systemName: "lock.fill"))
                        .padding(.bottom, 8)
                    
                    HStack {
                        Text("Already have an account? ")
                            .font(.system(size: 15, weight: .regular, design: .serif))
                            .foregroundStyle(.white)
                        
                        NavigationLink(
                            destination: LogInView(),
                            label: {
                                Text("Login")
                                    .font(.system(size: 15, weight: .regular, design: .serif))
                                    .foregroundStyle(.blue)
                            }
                        )
                    }
                    .padding(.bottom, 40)
                    
                    NavigationLink(
                        destination: SignUpView(),
                        label: {
                            Text("Sign Up")
                                .font(.system(size: 18, weight: .medium, design: .serif))
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
    SignUpView()
}
