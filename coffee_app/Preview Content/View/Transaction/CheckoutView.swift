import SwiftUI

struct CheckoutView: View {    
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var fullAddress = ""
    
    @State private var showingAddressSheet = false
    
    private var account = Session.shared.loggedInAccount
    @Environment(\.modelContext) private var context
    
    var beanCartItems: [BeanCartItem] {
        return account?.beanCartItems ?? []
    }
    var storeCartItems: [StoreCartItem] {
        return account?.storeCartItems ?? []
    }
    
    
    var selectedBeanCartItems: [BeanCartItem] {
        return beanCartItems.filter { $0.isSelected == true }
    }
    var selectedStoreCartItems: [StoreCartItem] {
        return storeCartItems.filter { $0.isSelected == true }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                
                ScrollView {
                    TextPageTitle(text: "Checkout")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                    
                    NavigationLink(destination: AddressSheet()) {
                        HStack {
                            VStack(alignment: .leading) {
                                TextSection(
                                    text: "Address",
                                    color: .white
                                )
                                .padding(.top)
                                .padding(.leading)
                                
                                TextParagraph(
                                    text: account?.addresses.isEmpty ?? true ? "No Address" :
                                        "\(account?.addresses.first?.region ?? "")" +
                                        ", \(account?.addresses.first?.province ?? "")" +
                                        ", \(account?.addresses.first?.city ?? "")" +
                                        "\n\(account?.addresses.first?.barangay ?? "") " +
                                        ", \(account?.addresses.first?.street ?? "")" +
                                        "\n\(account?.addresses.first?.zipCode ?? "")",
                                    color: .white
                                )
                                .padding(.bottom, 15)
                                .padding(.leading)

                            }
                            
                            Spacer()
                            
                            Image(systemName: "plus")
                                .font(.system(size: 16))
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.white, lineWidth: 1)
                        )
                    }
                    
                    ForEach(beanCartItems.filter {$0.isSelected == true}, id: \.name) { item in
                        CheckoutBeanCartItemView(item: item)
                    }
                    ForEach(storeCartItems.filter {$0.isSelected == true}, id: \.name) { item in
                        CheckoutStoreCartItemView(item: item)
                    }
                    
                } // ScrollView
                .padding(.horizontal)
                .background(.black)
                .padding(.bottom)
                
                VStack {
                    Spacer()
                    
                    Group {
                        ForEach(beanCartItems.filter {$0.isSelected == true}, id: \.name) { item in
                            checkoutRowElement(name: item.name, total: item.totalPrice, beanCartItem: item)
                                .padding(.bottom, 3)
                        }
                        ForEach(storeCartItems.filter {$0.isSelected == true}, id: \.name) { item in
                            checkoutRowElement(name: item.name, total: item.totalPrice, storeCartItem: item)
                        }
                    }
                    .background(.black)
                    .padding(.horizontal)
                    
                    HStack {
                        TextSection(
                            text: "Total:",
                            color: ThemeColor.brown
                        )
                        
                        Spacer()
                        
                        TextSection(
                            text: "₱\(String(format: "%.2f", getTotal()))",
                            color: ThemeColor.brown
                        )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                    .background(.black)
                    .padding(.horizontal)
                    
                    NavigationLink(destination: ConfirmationView()) {
                        Text("Place Order")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(ThemeColor.green)
                            .onTapGesture {
                                let transaction = Transaction(total: getTotal())
                                transaction.beanCartItems.append(contentsOf: selectedBeanCartItems)
                                transaction.storeCartItems.append(contentsOf: selectedStoreCartItems)
                                
                                Session.shared.loggedInAccount?.transactions.append(transaction)
                                
                                saveContext()
                            }
                    }
                }
                .padding(.bottom, 20)
                
            } // ZStack
        } // NavigationStack
    }
    
    private func getTotal() -> Double {
        let beanTotal = beanCartItems
            .filter { $0.isSelected == true }
            .reduce(0.0) { runningTotal, item in
                runningTotal + item.totalPrice
            }
        
        let storeTotal = storeCartItems
            .filter { $0.isSelected == true }
            .reduce(0.0) { runningTotal, item in
                runningTotal + item.totalPrice
            }
        
        return beanTotal + storeTotal
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving transaction: \(error)")
        }
    }
}

struct checkoutRowElement: View {
    var name: String
    var total: Double
    var beanCartItem: BeanCartItem? = nil
    var storeCartItem: StoreCartItem? = nil
    
    
    private let characterLimit = 30

    private var limitedName: String {
        if name.count > characterLimit {
            let endIndex = name.index(name.startIndex, offsetBy: characterLimit)
            return String(name[..<endIndex]) + "..."
        }
        return name
    }
    
    var body: some View {
        HStack {
            TextParagraph(text: limitedName)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Spacer()
            
            TextParagraph(text: "x ")
            TextParagraph(text: beanCartItem == nil ? "" : "\(beanCartItem!.quantity)")
            TextParagraph(text: storeCartItem == nil ? "" : "\(storeCartItem!.quantity)")
                .padding(.trailing, 3)
            
            TextParagraph(text: String(format: "%.2f", total))
                .lineLimit(1)
        } // HStack
    }
}

struct AddressSheet: View {
    // State variables to hold the user input
    @State private var name: String = ""
    @State private var region: String = ""
    @State private var province: String = ""
    @State private var city: String = ""
    @State private var barangay: String = ""
    @State private var street: String = ""
    @State private var zipCode: String = ""
    
    @Environment(\.modelContext) private var context
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                ScrollView {
                    AuthTextField(
                        text: $name,
                        hintText: "Name",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    AuthTextField(
                        text: $region,
                        hintText: "Region",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    AuthTextField(
                        text: $province,
                        hintText: "Province",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    AuthTextField(
                        text: $city,
                        hintText: "City",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    AuthTextField(
                        text: $barangay,
                        hintText: "Barangay",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    AuthTextField(
                        text: $street,
                        hintText: "Street",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    AuthTextField(
                        text: $zipCode,
                        hintText: "ZIP Code",
                        plainField: true
                    )
                    .padding(.bottom, 20)
                    
                    Button( action: {
                        Session.shared.loggedInAccount?.addresses.append(
                            Address(
                                name: name,
                                region: region,
                                province: province,
                                city: city,
                                barangay: barangay,
                                street: street,
                                zipCode: zipCode
                            )
                        )
                        
                        do {
                            try context.save()
                            showAlert = true
                        } catch {
                            print("Erro saving address: \(error)")
                        }
                    }) {
                        Text("Save Address")
                            .frame(maxWidth: .infinity)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(.vertical, 10)
                            .background(ThemeColor.green)
                            .cornerRadius(5)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Success"), message: Text("Successfully saved Address"), dismissButton: .default(Text("OK")))
                    }
                    
                    
                    
                } // ScrollView
                .padding(.horizontal)
                .background(Color.black)
                
            } // ZStack
        }
        .toolbarBackground(.black, for: .navigationBar)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}

