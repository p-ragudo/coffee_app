import SwiftUI

struct WhiteBorderButton: View {
    var text: String
    var width: CGFloat
    
    init(text: String, width: CGFloat) {
        self.text = text
        self.width = width
    }

    var body: some View {
        Button(action: {
            print("Button Pressed")
        }) {
            Text(text)
                .font(.system(size: 12, weight: .light, design: .serif))
                .foregroundStyle(.white)
                .lineLimit(1)
                .padding(.vertical, 8)
                .frame(width: width)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.white, lineWidth: 1)
                )
        }
    }
}

#Preview {
    WhiteBorderButton(text: "Light Roast", width: 160)
}
