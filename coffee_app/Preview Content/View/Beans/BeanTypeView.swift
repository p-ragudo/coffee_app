import SwiftUI

struct BeanTypeView: View {
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        ZStack {
            Image("beans_type")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
            Text(text)
                .font(.system(size: 35, weight: .semibold, design: .serif))
                .foregroundStyle(.white)
                .shadow(color: .black, radius: 5, x: 5, y: 5)
        }
    }
}

#Preview {
    BeanTypeView(text: "Arabica")
}
