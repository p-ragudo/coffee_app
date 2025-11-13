import SwiftUI

struct TextPageTitle: View {
    var text: String
    var size: CGFloat = 24
    var weight: Font.Weight = .semibold
    var color: Color = .white
    
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: weight, design: .serif))
            .foregroundStyle(color)
    }
}

struct TextSection: View {
    var text: String
    var size: CGFloat = 20
    var weight: Font.Weight = .semibold
    var color: Color = .white
    
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: weight, design: .serif))
            .foregroundStyle(color)
    }
}

struct TextParagraph: View {
    var text: String
    var size: CGFloat = 14
    var weight: Font.Weight = .light
    var color: Color = .white
    
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: weight, design: .serif))
            .foregroundStyle(color)
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TextHeader: View {
    var text: String
    var size: CGFloat = 30
    var weight: Font.Weight = .semibold
    var color: Color = .white
    
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: weight, design: .serif))
            .foregroundStyle(.white)
    }
}
