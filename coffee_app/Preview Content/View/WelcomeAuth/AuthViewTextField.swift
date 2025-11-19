import SwiftUI

struct AuthTextField: View {
    @Binding var text: String
    let hintText: String
    var icon: Image? = nil
    var iconTextPadding: CGFloat = 15
    var iconSize: CGFloat = 20
    var secureField: Bool = false
    var plainField: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            // icon and placeholder text
            HStack {
                icon?
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize, height: iconSize)
                    .foregroundStyle(.white)
                    .padding(.leading, iconTextPadding)
                
                if text.isEmpty {
                    Text(hintText)
                        .font(.system(size: 16, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.leading, plainField == false ? 0 : 15)
                        .padding(.vertical, 15)
                }
            } // HStack
            
            // text field
            Group {
                if secureField {
                    SecureField("", text: $text)
                        .font(.system(size: 16, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.vertical, 15)
                        .disableAutocorrection(true)
                        .padding(.leading, iconSize + iconTextPadding + 8)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .accentColor(.white)
                        .autocapitalization(.none)
                } else {
                    TextField("", text: $text)
                        .font(.system(size: 16, weight: .light, design: .serif))
                        .foregroundStyle(.white)
                        .padding(.vertical, 15)
                        .disableAutocorrection(true)
                        .padding(.leading, icon != nil ? (iconSize + iconTextPadding + 8) : 15)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .accentColor(.white)
                        .autocapitalization(.none)
                }
            }
        } // ZStack
    }
}
