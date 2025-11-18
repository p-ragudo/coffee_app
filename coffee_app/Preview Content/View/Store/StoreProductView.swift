import SwiftUI
import Foundation

struct StoreProductView: View {
    var storeProduct: StoreProduct
    
    @Environment(\.modelContext) var context
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Image("store_bg")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .scaledToFit()
                            .padding(.top, 50)
                        
                        Group {
                            TextPageTitle(text: storeProduct.name)
                                .padding(.bottom, 5)
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                    .font(.system(size: 12))

                                TextParagraph(
                                    text: "\(String(format: "%.1f", storeProduct.rating)) / 5",
                                    color: ThemeColor.green
                                )
                                .padding(.trailing, 15)
                                
                                TextParagraph(
                                    text: "\(Utils.formatAsK(number: storeProduct.numOfSold))+ sold",
                                    color: .blue
                                )
                                
                            }
                            .padding(.bottom, 2)
                            
                            Text("₱ \(String(format: "%.2f", storeProduct.price))")
                                .font(.system(size: 28, weight: .semibold, design: .serif))
                                .foregroundStyle(ThemeColor.brown)
                                .padding(.bottom, 30)
                            
                            
                            // INSERT FARM HERE
                            
                            Divider()
                                .background(.white)
                                .padding(.bottom, 30)
                            
                            TextSection(text: "Description")
                                .padding(.bottom, 15)
                            
                            TextParagraph(text:
                                """
                                This is where the description of the farm or shop goes. This is where they will describe all about their farm, the products they produce, or whatever they may be inclined to put in this section
                                
                                Additional things to say or describe a product will be here. It will be up to the shop or farm to decide what descriptions and product specifications they will include. Just that this section is for that purpose
                                
                                One last paragraph to demonstrate this section of the page. This is where descriptions will go about the product. More may be said depending on the farm and the descriptions and information they include. It is up to them.
                                """
                            )
                            .padding(.bottom, 30)
                            
                            Divider()
                                .background(.white)
                                .padding(.bottom, 40)
                            TextSection(text: "You Might Like")
                        }
                        .padding(.horizontal)
                        
                        // THIS IS A PLACEHOLDER FOR THE SLIDER
                        GridBuilderView(items: Controller.storeProducts, columns: 2, content: { product in
                            StoreProductCard(
                                image: product.image,
                                name: product.name,
                                price: product.price,
                                rating: product.rating,
                                numOfSold: product.numOfSold,
                                storeProduct: product
                            )
                        }, hSpacing: 20, vSpacing: 40)
                        .padding(.bottom, 80)
                        
                    } // Vstack
                } // ScrollView
                .background(.black)
                .edgesIgnoringSafeArea(.top)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            if let account = Session.shared.loggedInAccount {
                                if let existingItem = account.storeCartItems.first(where: { item in
                                    StoreCartItem.matches(item, product: storeProduct)
                                }) {
                                    existingItem.quantity += 1
                                    existingItem.totalPrice += existingItem.price
                                } else {
                                    account.storeCartItems.append(
                                        StoreCartItem(
                                            name: storeProduct.name,
                                            price: storeProduct.price,
                                            totalPrice: storeProduct.price,
                                            image: storeProduct.image,
                                            quantity: 1,
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
            
        } // NavigationStack
        .toolbarBackground(.black, for: .navigationBar)
    }
}

#Preview {
    StoreProductView(storeProduct: Controller.storeProducts.first!)
}

