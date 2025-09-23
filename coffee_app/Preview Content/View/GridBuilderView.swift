import SwiftUI

struct GridBuilderView<Item, Content: View>: View where Item: Identifiable {
    var items: [Item]
    var content: (Item) -> Content

    init(items: [Item], @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self.content = content
    }
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 5),
            GridItem(.flexible())
        ], spacing: 16) {
            ForEach(items) { item in
                content(item)
            }
        }
        .padding()
    }
}
