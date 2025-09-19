import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let hintText: String
    let icon: Image
    var iconTextPadding: CGFloat = 15
    var iconSize: CGFloat = 20
    
    var body: some View {
        ZStack(alignment: .leading) {
            // icon and placeholder text
            HStack {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize, height: iconSize)
                    .foregroundStyle(.white)
                    .padding(.leading, iconTextPadding)
                
                if text.isEmpty {
                    Text(hintText)
                        .foregroundStyle(.white)
                        .padding(.leading, 0)
                        .padding(.vertical, 15)
                }
            } // HStack
            
            // text field
            TextField("", text: $text)
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
        } // ZStack
    }
}
