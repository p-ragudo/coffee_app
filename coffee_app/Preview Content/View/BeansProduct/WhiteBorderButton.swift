import SwiftUI

struct WhiteBorderButton: View {
    var text: String
    var width: CGFloat
    var textSize: CGFloat
    var verticalPadding: CGFloat
    
    init(text: String, width: CGFloat, textSize: CGFloat = 12, verticalPadding: CGFloat = 8) {
        self.text = text
        self.width = width
        self.textSize = textSize
        self.verticalPadding = verticalPadding
    }

    var body: some View {
        Button(action: {
            print("Button Pressed")
        }) {
            Text(text)
                .font(.system(size: textSize, weight: .light, design: .serif))
                .foregroundStyle(.white)
                .lineLimit(1)
                .padding(.vertical, verticalPadding)
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
