import SwiftUI

struct CheckoutView: View {
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var fullAddress = ""
    
    @State private var showingAddressSheet = false

    var body: some View {
        NavigationStack {
            ScrollView {
                TextPageTitle(text: "Checkout")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                NavigationLink(destination: AddressSheet()) {
                    HStack {
                        TextSection(
                            text: "Address",
                            color: .gray
                        )
                            .padding()
                        
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
    @State private var region: String = ""
    @State private var province: String = ""
    @State private var city: String = ""
    @State private var barangay: String = ""
    @State private var street: String = ""
    @State private var zipCode: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                ScrollView {
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
                    .padding(.bottom, 20)
                    
                    
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
                    .padding(.bottom, 20)
                    
                    
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
                    .padding(.bottom, 20)
                    
                    
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
                    .padding(.bottom, 20)
                    
                    
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

