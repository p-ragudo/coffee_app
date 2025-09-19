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
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(40)
                    
                    CustomTextField(
                        text: $username,
                        hintText: "Username",
                        icon: Image(systemName: "person.fill"))
                        .padding(.bottom, 8)
                    CustomTextField(
                        text: $email,
                        hintText: "Email",
                        icon: Image(systemName: "envelope.fill"))
                        .padding(.bottom, 8)
                    CustomTextField(
                        text: $password,
                        hintText: "Password",
                        icon: Image(systemName: "lock.fill"), iconTextPadding: 20)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Text("Already have an account? ")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                        
                        NavigationLink(
                            destination: LogInView(),
                            label: {
                                Text("Login")
                                    .foregroundStyle(.blue)
                                    .font(.subheadline)
                            }
                        )
                    }
                    .padding(.bottom, 40)
                    
                    NavigationLink(
                        destination: SignUpView(),
                        label: {
                            Text("Sign Up")
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
