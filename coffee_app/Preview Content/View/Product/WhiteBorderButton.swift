import SwiftUI

struct WhiteBorderButton: View {
    var text: String
    var hPadding: CGFloat
    
    init(text: String, hPadding: CGFloat) {
        self.text = text
        self.hPadding = hPadding
    }

    var body: some View {
        Text(text)
            .foregroundStyle(.black)
            .padding(.horizontal, hPadding)
            .
    }
}

#Preview {
    WhiteBorderButton(text: "Light Roast", hPadding: 20)
}
