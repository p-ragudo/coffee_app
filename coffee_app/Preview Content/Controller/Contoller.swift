import SwiftUI

class Controller {
    static var beanTypes: [BeanType] = BeanTypeProvider.getItems()
    static var storeProductTypes: [StoreProductType] = StoreProductTypeProvider.getItems()
    static var beanProducts: [BeanProduct] = BeanProductsProvider.getItems()
    static var storeProducts: [StoreProduct] = StoreProductsProvider.getItems()
    static var farms: [Farm] = FarmsProvider.getFarms()
}

class Utils {
    static func formatAsK(number: Int) -> String {
        if number >= 1000 {
            let formattedNumber = Double(number) / 1000
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 1 // One decimal place for numbers like 1.5k
            formatter.minimumFractionDigits = 0 // No decimal for whole numbers like 2k
            formatter.numberStyle = .decimal
            return "\(formatter.string(from: NSNumber(value: formattedNumber)) ?? "")k"
        } else {
            return "\(number)"
        }
    }
}
