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
            // --- GRINDERS (4 items) ---
            StoreProduct(image: "grinder1", name: "Timemore C2 Max Manual Grinder", price: 2950.00, desc: desc[0], rating: 4.9, numOfSold: 4200),
            StoreProduct(image: "grinder2", name: "Delonghi KG79 Electric Blade Grinder", price: 1850.00, desc: desc[1], rating: 4.5, numOfSold: 3100),
            StoreProduct(image: "grinder3", name: "Comandante C40 MK4 Hand Grinder", price: 12500.00, desc: desc[2], rating: 5.0, numOfSold: 950),
            StoreProduct(image: "grinder4", name: "Eureka Mignon Filtro Electric Grinder", price: 9800.00, desc: desc[3], rating: 4.7, numOfSold: 620),

            // --- BREWERS (4 items) ---
            StoreProduct(image: "espresso1", name: "Hario V60 Pour Over Set (Size 02)", price: 1199.00, desc: desc[4], rating: 4.8, numOfSold: 5800),
            StoreProduct(image: "espresso2", name: "Bodum Chambord French Press (8 Cup)", price: 1890.00, desc: desc[5], rating: 4.6, numOfSold: 7100),
            StoreProduct(image: "espresso3", name: "Chemex Classic 6-Cup Brewer", price: 2600.00, desc: desc[6], rating: 4.9, numOfSold: 1550),
            StoreProduct(image: "espresso4", name: "AeroPress Go Travel Coffee Maker", price: 1950.00, desc: desc[7], rating: 4.7, numOfSold: 3500),

            // --- MACHINES (4 items) ---
            StoreProduct(image: "espresso5", name: "Breville Bambino Plus Espresso Machine", price: 34999.00, desc: desc[8], rating: 4.8, numOfSold: 510),
            StoreProduct(image: "espresso3", name: "Cuisinart 12-Cup Programmable Drip", price: 5450.00, desc: desc[9], rating: 4.5, numOfSold: 2800),
            StoreProduct(image: "espresso1", name: "Bialetti Moka Express Stovetop (6 Cup)", price: 1550.00, desc: desc[10], rating: 4.9, numOfSold: 6200),
            StoreProduct(image: "espresso1", name: "Nespresso Pixie Espresso Machine", price: 8900.00, desc: desc[11], rating: 4.6, numOfSold: 4100),
            
            // --- ACCESSORIES (4 items) ---
            StoreProduct(image: "moka1", name: "Digital Pour-Over Coffee Scale", price: 1450.00, desc: desc[12], rating: 4.7, numOfSold: 3900),
            StoreProduct(image: "moka2", name: "Gooseneck Electric Pour-Over Kettle", price: 3200.00, desc: desc[13], rating: 4.8, numOfSold: 2100),
            StoreProduct(image: "french1", name: "Hario V60 Glass Server (600ml)", price: 850.00, desc: desc[14], rating: 4.6, numOfSold: 5500),
            StoreProduct(image: "espresso4", name: "58mm Calibrated Espresso Tamper", price: 990.00, desc: desc[15], rating: 4.9, numOfSold: 1800),
        ]
    }

    private static var desc: [String] = [
        // 1. Timemore C2 Max Manual Grinder
        """
        A high-quality, entry-level manual grinder known for its incredible consistency. Featuring CNC stainless steel burrs and a sturdy aluminum alloy body, the C2 Max ensures a uniform grind size, crucial for any pour-over or French press method. Its capacity is ideal for brewing larger batches.
        """,

        // 2. Delonghi KG79 Electric Blade Grinder
        """
        This electric blade grinder is a straightforward and reliable choice for quick grinding. While it's a blade grinder, the KG79 is excellent for quickly processing coffee for drip machines and French press, providing efficiency and a simple, push-button operation.
        """,

        // 3. Comandante C40 MK4 Hand Grinder
        """
        Considered the gold standard in manual grinding. The C40 MK4 is an exceptionally precise and robust hand grinder featuring high-nitrogen stainless steel burrs. It delivers unmatched grind quality across all ranges, from espresso fine to coarse cold brew, making it a favorite for coffee professionals.
        """,

        // 4. Eureka Mignon Filtro Electric Grinder
        """
        A dedicated electric grinder for filter coffee, boasting 50mm flat burrs for speed and consistency. The Mignon Filtro offers stepless micrometric adjustment for precise control over your grind size, making it a powerful and stylish addition to any serious home brewing setup.
        """,

        // 5. Hario V60 Pour Over Set (Size 02)
        """
        The iconic Japanese pour-over system. This set includes the ceramic dripper and a serving carafe. The V60's large hole and spiral ribbing allow for a clean, nuanced, and flavorful cup of coffee, giving the brewer maximum control over flow rate and extraction.
        """,

        // 6. Bodum Chambord French Press (8 Cup)
        """
        The classic, timeless French press design. It's the simplest way to brew a rich, full-bodied coffee with a heavy mouthfeel. The 8-cup capacity is perfect for sharing, and the chrome frame with glass carafe makes it a beautiful countertop piece.
        """,

        // 7. Chemex Classic 6-Cup Brewer
        """
        The elegant, hourglass-shaped glass brewer known for its clarity and clean cup profile. When paired with Chemex bonded filters, it produces coffee free of sediments and bitterness, highlighting the delicate flavors of lighter roasts. A design icon in the coffee world.
        """,

        // 8. AeroPress Go Travel Coffee Maker
        """
        A compact, durable, and versatile coffee maker perfect for travelers or small kitchens. The AeroPress uses air pressure for a fast, clean immersion brew, producing a surprisingly rich and low-acidity cup. The 'Go' version packs all components into a convenient travel mug.
        """,

        // 9. Breville Bambino Plus Espresso Machine
        """
        A compact yet powerful home espresso machine capable of café-quality shots. It features a fast heat-up time and automatic milk texturing, making it easy to pull excellent espresso and create lattes or cappuccinos with rich microfoam.
        """,

        // 10. Cuisinart 12-Cup Programmable Drip
        """
        A high-capacity, fully programmable drip machine ideal for households that need coffee ready at a set time. It features a brew-pause function and a sturdy glass carafe, making it a reliable workhorse for standard, large-batch filter coffee.
        """,

        // 11. Bialetti Moka Express Stovetop (6 Cup)
        """
        The original Italian stovetop espresso maker. The Moka pot produces a strong, concentrated coffee—not quite espresso, but darker and richer than drip. It’s an affordable and classic way to make potent, flavorful coffee at home.
        """,

        // 12. Nespresso Pixie Espresso Machine
        """
        An ultra-compact and fast single-serve capsule machine. The Pixie offers the convenience of quick espresso with minimal cleanup. Ideal for busy individuals seeking consistent, high-quality, one-touch coffee.
        """,

        // 13. Digital Pour-Over Coffee Scale
        """
        A necessary tool for serious home brewing. This digital scale features a built-in timer, allowing you to accurately measure coffee grounds and water, ensuring consistency and precision in every pour-over or French press brew.
        """,

        // 14. Gooseneck Electric Pour-Over Kettle
        """
        Designed for pour-over brewing, the gooseneck spout provides ultimate control over the speed and placement of the water. This electric model offers precise temperature control, ensuring you hit the optimal temperature for extracting the best flavor.
        """,

        // 15. Hario V60 Glass Server (600ml)
        """
        A durable, heat-resistant glass server used to collect and serve coffee brewed from a pour-over cone. Its classic design and measurement markings make it a perfect pairing for V60 or other small-to-medium-sized brewers.
        """,

        // 16. 58mm Calibrated Espresso Tamper
        """
        A crucial accessory for espresso consistency. This tamper applies a calibrated amount of pressure, ensuring a level and perfectly compressed coffee bed, which is vital for achieving a balanced and optimal espresso extraction.
        """,
    ]
}
