import Foundation
import Observation
import SwiftData

@Observable
final class Session {
    // This is essentially your global object.
    static let shared = Session()
    
    // The actual logged-in Account object fetched from SwiftData
    var loggedInAccount: Account? = nil
    
    // Private initializer to ensure this class can only be created internally
    private init() {}
    
    // Helper function to set the account after successful login
    func setAccount(account: Account) {
        self.loggedInAccount = account
    }
    
    func clearSession() {
        self.loggedInAccount = nil
    }
}
