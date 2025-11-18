import SwiftUI
import SwiftData

@main
struct coffee_appApp: App {
    init() {
        // REMOVE this call before releasing your app!
        deleteSwiftDataStore(for: [Account.self])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Session.shared)
        }
        .modelContainer(for: [Account.self])
    }
    
    func deleteSwiftDataStore(for modelTypes: [any PersistentModel.Type]) {
        // 1. Get the URL for the default store location (Documents/Application Support)
        guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            print("Could not find Application Support directory.")
            return
        }

        let directoryURL = url.appendingPathComponent("default.store")
        
        // 2. The store name is based on the container identifier.
        // For the default configuration, the file is usually named default.sqlite
        let storeURL = directoryURL.appendingPathComponent("default.sqlite")
        
        do {
            // 3. Check if the store file exists and delete it
            if FileManager.default.fileExists(atPath: storeURL.path) {
                try FileManager.default.removeItem(at: storeURL)
                print("Successfully deleted SwiftData store: \(storeURL.lastPathComponent)")
            } else {
                print("Store file not found, no need to delete.")
            }
            
            // You may also need to delete the WAL (Write-Ahead Logging) files
            // which are created alongside the main sqlite file.
            // These will be deleted when you delete the directory that contains the files
            // which, in the case of the default store is the default.store directory
            if FileManager.default.fileExists(atPath: directoryURL.path) {
                 try FileManager.default.removeItem(at: directoryURL)
                 print("Successfully deleted SwiftData store directory: \(directoryURL.lastPathComponent)")
            }
            
        } catch {
            print("Error deleting SwiftData store: \(error.localizedDescription)")
        }
    }
}
