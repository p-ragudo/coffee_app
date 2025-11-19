import SwiftData

@Model
class Address {
    var name: String
    var region: String
    var province: String
    var city: String
    var barangay: String
    var street: String
    var zipCode: String
    
    init(name: String, region: String, province: String, city: String, barangay: String, street: String, zipCode: String) {
        self.name = name
        self.region = region
        self.province = province
        self.city = city
        self.barangay = barangay
        self.street = street
        self.zipCode = zipCode
    }
}
