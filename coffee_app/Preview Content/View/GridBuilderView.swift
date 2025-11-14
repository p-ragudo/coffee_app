import SwiftUI

struct GridBuilderView<Item, Content: View>: View where Item: Identifiable {
    var items: [Item]
    var columns: Int
    var content: (Item) -> Content
    var hSpacing: CGFloat
    var vSpacing: CGFloat
    var hPadding: CGFloat

    init(items: [Item], columns: Int, @ViewBuilder content: @escaping (Item) -> Content, hSpacing: CGFloat, vSpacing: CGFloat, hPadding: CGFloat = 16) {
        self.items = items
        self.columns = columns
        self.content = content
        self.hSpacing = hSpacing
        self.vSpacing = vSpacing
        self.hPadding = hPadding
    }
    
    var body: some View {
        let gridItems = Array(repeating: GridItem(.flexible(), spacing: hSpacing), count: columns)
        
        LazyVGrid(columns: gridItems, spacing: vSpacing) {
            ForEach(items) { item in
                content(item)
            }
        }
        .padding(.horizontal, hPadding)
    }
}
