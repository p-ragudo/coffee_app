import SwiftUI

struct FloatingTabBarView: View {
    @State private var selectedTab = 0 // Track selected tab
    @State private var customBeanType: BeanType? = nil
    
    init(selectedTab: Int = 0, customBeanType: BeanType? = nil) {
            _selectedTab = State(initialValue: selectedTab) // Initialize selectedTab with default or passed value
            _customBeanType = State(initialValue: customBeanType) // Initialize customBeanType with default or passed value
        }

    var body: some View {
        ZStack {
            // Main Content Views (Tab Content)
            TabView(selection: $selectedTab) {
                NavigationStack {
                    HomeView()
                }
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                    .tag(0)

                NavigationStack {
                                    if let bean = customBeanType {
                                        // If customBeanType is not nil, load the BeanDetailView
                                        BeansTypeView(beanType: bean)
                                    } else {
                                        // Otherwise, load BeansView
                                        BeansView()
                                    }
                                }
                                .tabItem {
                                    Image(systemName: "star.fill")
                                }
                                .tag(1)

                NavigationStack {
                    FarmsView()
                }
                    .tabItem {
                        Image(systemName: "leaf.fill")
                    }
                    .tag(2)

                NavigationStack {
                    StoreView()
                }
                    .tabItem {
                        Image(systemName: "bag.fill")
                    }
                    .tag(3)

                NavigationStack {
                    CartView()
                }
                    .tabItem {
                        Image(systemName: "cart")
                    }
                    .tag(4)
            }
            .accentColor(.white) // Change color of the selected tab item

            // Custom Floating Tab Bar
            VStack {
                Spacer() // Push tab bar to bottom
                HStack {
                    TabBarIcon(isSelected: selectedTab == 0, imageName: "house.fill", action: { selectedTab = 0 })
                    TabBarIcon(isSelected: selectedTab == 1, imageName: "star.fill", action: { selectedTab = 1 })
                    TabBarIcon(isSelected: selectedTab == 2, imageName: "leaf.fill", action: { selectedTab = 2 })
                    TabBarIcon(isSelected: selectedTab == 3, imageName: "bag.fill", action: { selectedTab = 3 })
                    TabBarIcon(isSelected: selectedTab == 4, imageName: "cart", action: { selectedTab = 4 })
                }
                .padding()
                .background(Color.black) // Tab bar background color
                .cornerRadius(30) // Rounded corners
                .shadow(radius: 10) // Shadow for floating effect
                .padding(.horizontal, 20) // Optional padding from the sides
                .padding(.bottom, 10) // Space from the bottom edge
            }
            .ignoresSafeArea(edges: .bottom) // Ensures tab bar stays above the home indicator
        }
    }
}

struct TabBarIcon: View {
    var isSelected: Bool
    var imageName: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .font(.system(size: 24))
                .foregroundColor(isSelected ? ThemeColor.green : .white) // Highlight the selected icon
                .padding()
        }
        .frame(maxWidth: .infinity) // Makes each icon take equal space
    }
}
