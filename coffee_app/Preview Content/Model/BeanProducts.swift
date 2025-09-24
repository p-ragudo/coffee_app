import Foundation
import SwiftUI

struct BeanProduct: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var price: Double
    var desc: String
    var rating: Double
    var numOfSold: Int
}

class BeanProductsProvider {
    static func getItems() -> [BeanProduct] {
        return [
            // REPLACE EACH IMAGE AND NAVIGATION DESTINATION TO THE APPROPRIATE ONE
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product 1", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product 2", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product 3", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product 4", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product 5", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product 6", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product 7", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product 8", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
        ]
    }
}

