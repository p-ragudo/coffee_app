import SwiftUI

struct ImageSliderView<Item, Content: View>: View where Item: Identifiable {
    var items: [Item]
    var content: (Item) -> Content
    var hSpacing: CGFloat
    var automaticScrolling: Bool // New boolean attribute to control automatic scrolling
    
    // State for tracking the current index
    @State private var currentIndex: Int = 0
    // Timer for automatic scrolling
    @State private var timer: Timer? = nil
    
    init(items: [Item], automaticScrolling: Bool = true, @ViewBuilder content: @escaping (Item) -> Content, hSpacing: CGFloat) {
        self.items = items
        self.content = content
        self.hSpacing = hSpacing
        self.automaticScrolling = automaticScrolling
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { scrollProxy in
                    HStack(spacing: hSpacing) {
                        ForEach(items) { item in
                            content(item)
                                .id(item.id) // Assign an id to each item for scrollProxy to use
                        }
                    }
                    .onChange(of: currentIndex) { newIndex in
                        // Scroll to the new index when it changes
                        withAnimation {
                            scrollProxy.scrollTo(items[newIndex].id, anchor: .center)
                        }
                    }
                }
            }
            .onAppear {
                // Start the automatic scrolling if it's enabled
                if automaticScrolling {
                    startAutoScroll()
                }
            }
            .onDisappear {
                // Invalidate the timer when the view disappears
                timer?.invalidate()
            }
        }
    }
    
    // Function to start automatic scrolling
    private func startAutoScroll() {
        // Set up a timer to change the index every few seconds
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            // Update the currentIndex (looping back to 0 if it goes past the array bounds)
            withAnimation {
                currentIndex = (currentIndex + 1) % items.count
            }
        }
    }
}
