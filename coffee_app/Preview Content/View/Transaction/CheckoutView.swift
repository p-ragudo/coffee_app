import SwiftUI

struct AddressFormView: View {
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var regionProvinceCityBarangay = ""
    @State private var postalCode = ""
    @State private var streetAddress = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                TextPageTitle(text: "Checkout")
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading, spacing: 15) {
                    TextSection(text: "Address")
                        .padding(.horizontal)
                    
                    // Full Name
                    VStack(alignment: .leading) {
                        Text("Full Name")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        TextField("Enter full name", text: $fullName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.white, lineWidth: 1))
                    }
                    .padding(.horizontal)
                    
                    // Phone Number
                    VStack(alignment: .leading) {
                        Text("Phone Number")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        TextField("Enter phone number", text: $phoneNumber)
                            .keyboardType(.phonePad)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.white, lineWidth: 1))
                    }
                    .padding(.horizontal)
                    
                    // Region, Province, City, Barangay
                    VStack(alignment: .leading) {
                        Text("Region, Province, City, Barangay")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        TextField("Enter region, province, city, barangay", text: $regionProvinceCityBarangay)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.white, lineWidth: 1))
                    }
                    .padding(.horizontal)
                    
                    // Postal Code
                    VStack(alignment: .leading) {
                        Text("Postal Code")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        TextField("Enter postal code", text: $postalCode)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.white, lineWidth: 1))
                    }
                    .padding(.horizontal)
                    
                    // Street Address
                    VStack(alignment: .leading) {
                        Text("Street name, Building, House No.")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        TextField("Enter street name, building, house number", text: $streetAddress)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).strokeBorder(.white, lineWidth: 1))
                    }
                    .padding(.horizontal)
                    
                    
                    Spacer()
                }
                .padding(.vertical)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 0.8)
                )
            } // ScrollView
            .padding(.horizontal)
            .background(.black)
        } // NavigationStack
        
        
    }
}

struct AddressFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddressFormView()
    }
}
