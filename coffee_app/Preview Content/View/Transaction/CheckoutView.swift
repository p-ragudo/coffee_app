import SwiftUI

struct CheckoutView: View {
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var fullAddress = ""
    
    @State private var showingAddressSheet = false
    
    private var account = Session.shared.loggedInAccount

    var body: some View {
        NavigationStack {
            ScrollView {
                TextPageTitle(text: "Checkout")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                NavigationLink(destination: AddressSheet()) {
                    HStack {
                        VStack(alignment: .leading) {
                            TextSection(
                                text: "Address",
                                color: .gray
                            )
                            .padding(.top)
                            .padding(.leading)
                            
                            TextParagraph(
                                text: account?.addresses.isEmpty ?? true ? "No Address" :
                                    "\(account?.addresses.first?.region ?? "") " +
                                    ", \(account?.addresses.first?.city ?? "") " +
                                    ", \(account?.addresses.first?.barangay ?? "") " +
                                    ", \(account?.addresses.first?.street ?? "")",
                                color: .gray
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
                
            } // ScrollView
            .padding(.horizontal)
            .background(.black)
        } // NavigationStack
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
                    TextParagraph(
                        text: "Name",
                        size: 18
                    )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AuthTextField(
                        text: $name,
                        hintText: "Name",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    
                    TextParagraph(
                        text: "Region",
                        size: 18
                    )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AuthTextField(
                        text: $region,
                        hintText: "Region",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    //
                    TextParagraph(
                        text: "Province",
                        size: 18
                    )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AuthTextField(
                        text: $province,
                        hintText: "Province",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    //
                    TextParagraph(
                        text: "City",
                        size: 18
                    )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AuthTextField(
                        text: $city,
                        hintText: "City",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    //
                    TextParagraph(
                        text: "Barangay",
                        size: 18
                    )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AuthTextField(
                        text: $barangay,
                        hintText: "Barangay",
                        plainField: true
                    )
                    .padding(.bottom, 15)
                    
                    
                    //
                    TextParagraph(
                        text: "ZIP Code",
                        size: 18
                    )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
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

