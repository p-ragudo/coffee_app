import SwiftUI

struct WhiteBorderButton: View {
    var text: String
    var width: CGFloat
    var textSize: CGFloat = 12
    var verticalPadding: CGFloat = 8
    var isOption: Bool = true
    
    var selected: Binding<String>?
    
//    init(text: String, width: CGFloat, textSize: CGFloat = 12, verticalPadding: CGFloat = 8, isOption: Bool = true) {
//        self.text = text
//        self.width = width
//        self.textSize = textSize
//        self.verticalPadding = verticalPadding
//        self.isOption = isOption
//    }

    var body: some View {
        if isOption {
            Button(action: {
                selected?.wrappedValue = text
            }) {
                Text(text)
                    .font(.system(size: textSize, weight: .light, design: .serif))
                    .foregroundStyle(isSelected ? .black : .white)
                    .lineLimit(1)
                    .padding(.vertical, verticalPadding)
                    .frame(width: width)
                    .background(isSelected ? .white : .clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.white, lineWidth: 1)
                    )
            }
        } else {
            Button(action: {
//                selected = text
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
    
    private var isSelected: Bool {
        if isOption, let selected = selected?.wrappedValue {
            return selected == text
        }
        return false
    }
}

//#Preview {
//    WhiteBorderButton(text: "Light Roast", width: 160, selected: $selected?)
//}
