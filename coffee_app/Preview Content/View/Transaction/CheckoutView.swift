import SwiftUI

struct AddressFormView: View {
    @State private var fullName = ""
    @State private var phoneNumber = ""
    @State private var fullAddress = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                TextPageTitle(text: "Checkout")
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading, spacing: 15) {
                    TextSection(text: "Address")
                        .padding(.horizontal)
                    
                    customTextField("Full Name", text: $fullName)
                                        
                    // Phone Number
                    customTextField("Phone Number", text: $phoneNumber, keyboardType: .phonePad)
                                        
                    // Region, Province, City, Barangay
                    customTextField("Full Address", text: $fullAddress)
                                        
                    
                    
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
    
    @ViewBuilder
        func customTextField(_ placeholder: String, text: Binding<String>, keyboardType: UIKeyboardType = .default) -> some View {
            ZStack(alignment: .leading) {
                if text.wrappedValue.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.white.opacity(0.5))
                        .padding(.leading, 12)
                }
                TextField("", text: text)
                    .keyboardType(keyboardType)
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 0.8)
                    )
            }
            .padding(.horizontal)
        }
}

struct AddressFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddressFormView()
    }
}
