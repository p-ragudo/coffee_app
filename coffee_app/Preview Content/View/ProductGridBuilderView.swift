import SwiftUI

struct ProductGridBuilderView<Item, Content: View>: View where Item: Identifiable {
    var items: [Item]
    var content: (Item) -> Content

    init(items: [Item], @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self.content = content
    }
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 15),
            GridItem(.flexible())
        ], spacing: 30) {
            ForEach(items) { item in
                content(item)
            }
        }
        .padding()
    }
}
