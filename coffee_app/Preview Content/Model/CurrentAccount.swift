import SwiftData

@Model
class CurrentAccount {
    var account: Account?
    
    init(account: Account? = nil) {
        self.account = account
    }
}
