import SwiftUI
import SwiftData

@main
struct coffee_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Session.shared)
        }
        .modelContainer(for: [Account.self])
    }
}
