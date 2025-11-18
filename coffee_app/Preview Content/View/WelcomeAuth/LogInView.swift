import SwiftUI
import SwiftData

struct LogInView: View {
    @State var usernameEmail: String = ""
    @State var password: String = ""
    
    @State private var loginError: String? = nil
    @State private var isLoggedIn: Bool = false
    
    @Query var accounts: [Account]
    
    var body: some View {
        NavigationStack{
            ZStack {
                // INSERT IMAGE HERE
                
                VStack {
                    Spacer()
                    
                    Text("Log In")
                        .font(.system(size: 32, weight: .medium, design: .serif))
                        .foregroundStyle(.white)
                        .padding(40)
                    
                    AuthTextField(
                        text: $usernameEmail,
                        hintText: "Email / Username",
                        icon: Image(systemName: "person.fill"))
                        .padding(.bottom, 8)
                    AuthTextField(
                        text: $password,
                        hintText: "Password",
                        icon: Image(systemName: "lock.fill"),
                        secureField: true
                    )
                    .padding(.bottom, 8)
                    
                    HStack {
                        Text("Don't have an account? ")
                            .font(.system(size: 15, weight: .regular, design: .serif))
                            .foregroundStyle(.white)
                        
                        NavigationLink(
                            destination: SignUpView(),
                            label: {
                                Text("Sign Up")
                                    .font(.system(size: 15, weight: .regular, design: .serif))
                                    .foregroundStyle(.blue)
                            }
                        )
                    }
                    .padding(.bottom, 40)
                    
                    
                    Button(action: {
                        loginError = nil

                        // Check if fields are empty
                        if usernameEmail.isEmpty || password.isEmpty {
                            loginError = "Username/Email or Password cannot be empty."
                            return
                        }
                        
                        // Attempt to log in
                        let isValidLogin = login()
                        if isValidLogin {
                            // If login is successful, navigate to HomeView
                            print("Login successful!")
                            loginError = nil // Clear any previous errors
                            isLoggedIn = true // Set the state to trigger navigation
                        } else {
                            // If login fails, show error message
                            loginError = "Invalid username/email or password."
                            isLoggedIn = false
                        }
                    }) {
                        Text("Log In")
                            .font(.system(size: 18, weight: .medium, design: .serif))
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .padding(.vertical, 15)
                            .background(ThemeColor.brown)
                            .cornerRadius(8)
                            .padding(.bottom, 40)
                    }
                    
                    NavigationLink(
                       destination: FloatingTabBarView(),
                       isActive: $isLoggedIn
                    ){
                       EmptyView()
                    }
                    
                } // VStack
            } // ZStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.black) // REMOVE ONCE BACKGROUND IMAGE IS PRESENT
            .edgesIgnoringSafeArea(.all) // REMOVE ONCE BACKGROUND IMAGE IS PRESENT
            
        } // NavigationStack
    }
    
    func login() -> Bool {
        if let foundAccount = accounts.first(where: { account in
            (
                account.username.lowercased() == usernameEmail.lowercased() ||
                account.email.lowercased() == usernameEmail.lowercased()
            ) &&
            account.password == password
        }) {
            Session.shared.loggedInAccount = foundAccount
            return true
        }
        
        return false
    }
}

#Preview {
    LogInView()
}
