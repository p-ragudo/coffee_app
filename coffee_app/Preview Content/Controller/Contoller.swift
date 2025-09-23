import SwiftUI

class Controller {
    var beanTypes: [BeanType]
    var storeProductTypes: [StoreProductType]
    
    init() {
        self.beanTypes = BeanTypeProvider.getItems()
        self.storeProductTypes = StoreProductTypeProvider.getItems()
    }
}
