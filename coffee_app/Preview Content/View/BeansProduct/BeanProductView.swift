import SwiftUI
import Foundation

struct Size: Identifiable {
    var id = UUID()
    var size: String
}

struct BeanProductView: View {
    @Environment(\.modelContext) var context
    
    var beanProduct: BeanProduct
    
    // ADD ROAST TYPE FOR PRODUCT IN MODEL. THIS IS A PLACEHOLDER
    let roastTypes = [
        RoastType(type: "Light Roast"),
        RoastType(type: "Medium Roast"),
        RoastType(type: "Medium-Dark Roast"),
        RoastType(type: "Dark Roast")
    ]
    
    // PLACEHOLDER ARRAY FOR SIZES, FOR DISPLAYING CONTENT
    let sizes = [
        Size(size: "100g (3.5oz)"),
        Size(size: "250g (8.8oz)"),
        Size(size: "500g (17.6oz)"),
        Size(size: "1kg (2.2 lbs)"),
        Size(size: "2.5kg (5.5 lbs)"),
    ]
    
    init(beanProduct: BeanProduct) {
        self.beanProduct = beanProduct
    }
    
    
    @State var selectedRoastType = "Light Roast"
    @State var selectedSize = "100g (3.5oz)"
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    Image("bean_product")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .padding(.top, 50)
                    
                    Group {
                        VStack(alignment: .leading) {
                            TextPageTitle(text: beanProduct.name)
                            .padding(.bottom, 5)
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                    .font(.system(size: 12))
                                Text("\(String(format: "%.1f", beanProduct.rating)) / 5")
                                    .font(.system(size: 14, weight: .light, design: .serif))
                                    .foregroundStyle(ThemeColor.green)
                                    .padding(.trailing, 15)
                                Text("\(Utils.formatAsK(number: beanProduct.numOfSold))+ sold")
                                    .font(.system(size: 14, weight: .light, design: .serif))
                                    .foregroundStyle(.blue)
                            }
                            .padding(.bottom, 2)
                            
                            Text("₱ \(String(format: "%.2f", beanProduct.price))")
                                .font(.system(size: 28, weight: .semibold, design: .serif))
                                .foregroundStyle(ThemeColor.brown)
                                .padding(.bottom, 30)
                            
                            
                            TextSection(text: "Available Roast Types")
                            // ROAST TYPES WITH PLACEHOLDER VALUES (SEE TOP)
                            GridBuilderView(items: roastTypes, columns: 2, content: { roastType in
                                WhiteBorderButton(
                                    text: roastType.type,
                                    width: 180,
                                    selected: $selectedRoastType
                                )
                            }, hSpacing: 5, vSpacing: 8, hPadding: 0)
                            .padding(.bottom, 25)
                            
                            
                            TextSection(text: "Sizes")
                            // SIZES WITH PLACEHOLDER VALUES (SEE TOP)
                            GridBuilderView(items: sizes, columns: 3, content: { size in
                                WhiteBorderButton(
                                    text: size.size,
                                    width: 115,
                                    selected: $selectedSize
                                )
                            }, hSpacing: 0, vSpacing: 10, hPadding: 0)
                            .padding(.bottom, 30)
                            
                            Divider()
                                .background(.white)
                                .padding(.bottom, 30)
                            
                            TextSection(text: "Description")
                                .padding(.bottom, 15)
                            TextParagraph(text: beanProduct.desc)
                            .padding(.bottom, 30)
                            
                            Divider()
                                .background(.white)
                                .padding(.bottom, 10)
                            
                            HStack {
                                Image("farm_bg")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .padding(.trailing, 10)
                                
                                VStack(alignment: .leading) {
                                    Text("Farm Name Goes Here")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 13, weight: .medium, design: .serif))
                                    Text("Location of Farm")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 13, weight: .light, design: .serif))
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("5.0")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 13, weight: .medium, design: .serif))
                                    Text("Rating")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 12, weight: .medium, design: .serif))
                                    WhiteBorderButton(
                                        text: "Visit",
                                        width: 70,
                                        textSize: 12,
                                        verticalPadding: 5,
                                        isOption: false
                                    )
                                }
                                .padding(.trailing)
                        
                            }
                            .padding(.bottom, 10)
                            
                            Divider()
                                .background(.white)
                                .padding(.bottom, 30)
                            
                            TextSection(text: "You Might Like")
                        } // Vstack
                    } // Group
                    .padding(.horizontal)
                    ImageSliderView(items: Controller.beanProducts, automaticScrolling: false, content: { beanProduct in
                        BeanProductCard(
                            image: beanProduct.image,
                            name: beanProduct.name,
                            price: beanProduct.price,
                            rating: beanProduct.rating,
                            numOfSold: beanProduct.numOfSold,
                            beanProduct: beanProduct,
                            imageScale: 0.7
                        )
                    }, hSpacing: 20)
                    .padding(.bottom, 80)
                } // ScrollView
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            if let account = Session.shared.loggedInAccount {
                                if let existingItem = account.beanCartItems.first(where: { item in
                                    BeanCartItem.matches(item, product: beanProduct, roastType: selectedRoastType, size: selectedSize)
                                }) {
                                    existingItem.quantity += 1
                                    existingItem.totalPrice += existingItem.price
                                } else {
                                    account.beanCartItems.append(
                                        BeanCartItem(
                                            name: beanProduct.name,
                                            price: beanProduct.price,
                                            totalPrice: beanProduct.price,
                                            image: beanProduct.image,
                                            quantity: 1,
                                            roastType: selectedRoastType,
                                            size: selectedSize,
                                            isSelected: true
                                        )
                                    )
                                }
                            }
                            
                            do {
                                try context.save()
                                showAlert = true
                            } catch {
                                print("Failed to add to cart: \(error)")
                            }
                        }) {
                            Text("Add to Cart")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity) // Take up equal space
                                .padding()
                                .background(ThemeColor.brown)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Success"), message: Text("Successfully Added to Cart"), dismissButton: .default(Text("OK")))
                        }
                        
                        Button(action: {
                            print("Buy Now tapped")
                        }) {
                            Text("Buy Now")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity) // Take up equal space
                                .padding()
                                .background(ThemeColor.green)
                        }
                    }
                    .padding(.bottom, 20) // Space from the bottom edge
                    .background(Color.black) // Tab bar background color
                    .shadow(radius: 10) // Floating effect shadow
                    .padding(.bottom, 15)
                }
                .ignoresSafeArea(edges: .bottom)
                
            } // ZStack
            .background(.black)
            .edgesIgnoringSafeArea(.top)
            
            
            
        } // NavigationStack
        .toolbarBackground(.black, for: .navigationBar)
    }
}

#Preview {
    BeanProductView(beanProduct: Controller.beanProducts.first!)
}
