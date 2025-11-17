import SwiftUI
import SwiftData

@main
struct coffee_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Account.self])
    }
}
