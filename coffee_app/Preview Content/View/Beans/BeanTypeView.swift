import SwiftUI

struct BeanTypeView: View {
    var text: String
    var beanType: BeanType
    
    init(text: String, beanType: BeanType) {
        self.text = text
        self.beanType = beanType
    }
    
    var body: some View {
        NavigationLink(destination: BeansTypeView(beanType: beanType)) {
            ZStack {
                Image("beans_type")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180)
                Text(text)
                    .font(.system(size: 35, weight: .semibold, design: .serif))
                    .foregroundStyle(.white)
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
            } // ZStack
        } // NavigationLink
    }
}

#Preview {
    BeanTypeView(text: "Arabica", beanType: Controller.beanTypes.first!)
}
