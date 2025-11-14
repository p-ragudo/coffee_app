import SwiftUI

struct WhiteBorderButton: View {
    var text: String
    var width: CGFloat
    var textSize: CGFloat
    var verticalPadding: CGFloat
    var isOption: Bool = true
    @State var isPressed: Bool = false
    
    init(text: String, width: CGFloat, textSize: CGFloat = 12, verticalPadding: CGFloat = 8, isOption: Bool = true) {
        self.text = text
        self.width = width
        self.textSize = textSize
        self.verticalPadding = verticalPadding
        self.isOption = isOption
    }

    var body: some View {
        if isOption {
            Button(action: {
                print(text)
                if isPressed {
                    isPressed = false
                } else {
                    isPressed = true
                }
            }) {
                if isPressed {
                    Text(text)
                        .font(.system(size: textSize, weight: .light, design: .serif))
                        .foregroundStyle(.black)
                        .lineLimit(1)
                        .padding(.vertical, verticalPadding)
                        .frame(width: width)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.white, lineWidth: 1)
                        )
                } else {
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
        } else {
            Button(action: {
                print(text)
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
}

#Preview {
    WhiteBorderButton(text: "Light Roast", width: 160)
}
