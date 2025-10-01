import Foundation
import SwiftUI

struct StoreProduct: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var price: Double
    var desc: String
    var rating: Double
    var numOfSold: Int
}

class StoreProductsProvider {
    static func getItems() -> [StoreProduct] {
        return [
            // REPLACE EACH IMAGE AND NAVIGATION DESTINATION TO THE APPROPRIATE ONE
            StoreProduct(image: "grinders_card", name: "A high-quality coffee accessory product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            StoreProduct(image: "brewers_card", name: "A high-quality coffee accessory product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            StoreProduct(image: "machines_card", name: "A high-quality coffee accessory product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            StoreProduct(image: "acs_card", name: "A high-quality coffee accessory product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            StoreProduct(image: "grinders_card", name: "A high-quality coffee accessory product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
            StoreProduct(image: "brewers_card", name: "A high-quality coffee accessory product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500),
        ]
    }
}


