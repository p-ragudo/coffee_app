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
    var navigateTo: AnyView
}

class BeanProductsProvider {
    static func getItems() -> [BeanProduct] {
        return [
            // REPLACE EACH IMAGE AND NAVIGATION DESTINATION TO THE APPROPRIATE ONE
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500, navigateTo: AnyView(WelcomeView())),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500, navigateTo: AnyView(WelcomeView())),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500, navigateTo: AnyView(WelcomeView())),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500, navigateTo: AnyView(WelcomeView())),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500, navigateTo: AnyView(WelcomeView())),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500, navigateTo: AnyView(WelcomeView())),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500, navigateTo: AnyView(WelcomeView())),
            BeanProduct(image: "arabica_card", name: "A nutricious and delicious bean product", price: 795.43, desc: "Description goes here in this section", rating: 4.6, numOfSold: 1500, navigateTo: AnyView(WelcomeView())),
        ]
    }
}

