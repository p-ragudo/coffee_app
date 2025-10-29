import Foundation

class AccountController: ObservableObject {
    @Published var currentAccount: Account?
    
    private let userDefaultsKey = "currentAccount"
    
    init() {
        loadAccount()
    }
    
    func saveAccount(_ account: Account) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(account) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
            currentAccount = account
        }
    }
    
    func loadAccount() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey) {
            let decoder = JSONDecoder()
            if let loadedAccount = try? decoder.decode(Account.self, from: savedData) {
                currentAccount = loadedAccount
            }
        }
    }
    
    func deleteAccount() {
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
        currentAccount = nil
    }
    
    func isLoggedIn() -> Bool {
        return currentAccount != nil
    }
    
    func printAccount() {
        if let account = currentAccount {
            print("Account Saved: \(account.username), \(account.email), \(account.password)")
        } else {
            print("No account found in UserDefaults.")
        }
    }
    
    func login(usernameEmail: String, password: String) -> Bool {
        guard let savedAccount = currentAccount else { return false }
            
            // Check if either username or email matches and password is correct
            if (savedAccount.username == usernameEmail || savedAccount.email == usernameEmail) && savedAccount.password == password {
                return true
            }
            
            return false
        }
}
