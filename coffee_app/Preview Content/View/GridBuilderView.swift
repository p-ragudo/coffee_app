import SwiftUI

struct GridBuilderView<Item, Content: View>: View where Item: Identifiable {
    var items: [Item]
    var content: (Item) -> Content
    var hSpacing: CGFloat
    var vSpacing: CGFloat

    init(items: [Item], @ViewBuilder content: @escaping (Item) -> Content, hSpacing: CGFloat, vSpacing: CGFloat) {
        self.items = items
        self.content = content
        self.hSpacing = hSpacing
        self.vSpacing = vSpacing
    }
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: hSpacing),
            GridItem(.flexible())
        ], spacing: vSpacing) {
            ForEach(items) { item in
                content(item)
            }
        }
        .padding()
    }
}
