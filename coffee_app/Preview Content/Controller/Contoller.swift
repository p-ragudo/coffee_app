import SwiftUI

class Controller {
    var beanTypes: [BeanType]
    var storeProductTypes: [StoreProductType]
    var beanProducts: [BeanProduct]
    
    init() {
        self.beanTypes = BeanTypeProvider.getItems()
        self.storeProductTypes = StoreProductTypeProvider.getItems()
        self.beanProducts = BeanProductsProvider.getItems()
    }
}
