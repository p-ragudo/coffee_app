import Foundation

struct Account: Codable, Identifiable {
    var id = UUID()
    var username: String
    var email: String
    var password: String
}
