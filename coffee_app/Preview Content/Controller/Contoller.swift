import SwiftUI

class Controller {
    var beanTypes: [BeanType]
    
    init() {
        self.beanTypes = BeanTypeProvider.getCoffeeItems()
    }
}
