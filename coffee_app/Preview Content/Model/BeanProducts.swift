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
            BeanProduct(image: "arabica_card", name: "Sagada Arabica - Medium Roast", price: 220.00, desc: desc[0], rating: 4.8, numOfSold: 6750),
            BeanProduct(image: "arabica_card", name: "Benguet Arabica - Atok Origin", price: 230.00, desc: desc[1], rating: 4.7, numOfSold: 4200),
            BeanProduct(image: "arabica_card", name: "Mt. Apo Arabica - Fully Washed", price: 410.00, desc: desc[2], rating: 4.9, numOfSold: 2980),
            BeanProduct(image: "arabica_card", name: "Sultan Kudarat Arabica", price: 190.00, desc: desc[3], rating: 4.6, numOfSold: 3150),
            BeanProduct(image: "robusta_card", name: "Kalinga Robusta - Dark Roast", price: 110.00, desc: desc[4], rating: 4.5, numOfSold: 9800),
            BeanProduct(image: "arabica_card", name: "Cavite Robusta - Double Roasted", price: 90.00, desc: desc[5], rating: 4.4, numOfSold: 8120),
            BeanProduct(image: "arabica_card", name: "Ifugao Robusta", price: 130.00, desc: desc[6], rating: 4.5, numOfSold: 5500),
            BeanProduct(image: "liberoca_card", name: "Batangas Barako (Liberica)", price: 280.00, desc: desc[7], rating: 4.9, numOfSold: 15300),
            BeanProduct(image: "arabica_card", name: "Lipa Barako - Heritage", price: 320.00, desc: desc[8], rating: 4.8, numOfSold: 3550),
            BeanProduct(image: "arabica_card", name: "Barako House Blend (L+R)", price: 150.00, desc: desc[9], rating: 4.7, numOfSold: 11200),
            BeanProduct(image: "excelsa_card", name: "Excelsa - Single Origin Cavite", price: 160.00, desc: desc[10], rating: 4.6, numOfSold: 3700),
            BeanProduct(image: "arabica_card", name: "Excelsa-Robusta Blend", price: 120.00, desc: desc[11], rating: 4.5, numOfSold: 5990),
            BeanProduct(image: "arabica_card", name: "Pinoy Breakfast Blend", price: 80.00, desc: desc[12], rating: 4.6, numOfSold: 7100),
            BeanProduct(image: "arabica_card", name: "Dark Side Blend", price: 470.00, desc: desc[13], rating: 4.4, numOfSold: 6320),
            BeanProduct(image: "arabica_card", name: "Kape Maria Cordillera (Arabica)", price: 429.00, desc: desc[14], rating: 4.7, numOfSold: 2100)
        ]
    }

    private static var desc: [String] = [
        // 1. Sagada Arabica - Medium Roast
        """
        Sagada Arabica is a crown jewel of the Cordillera region, cherished for its smooth and exquisitely balanced profile. Grown at high altitudes in Mountain Province, these beans develop slowly, concentrating the nuanced flavors that make this coffee a Northern Luzon classic. It's the perfect daily drinker for those who appreciate finesse over force.
        \nThe flavor profile is characterized by **mild acidity** and a **nutty-sweetness**, often exhibiting undertones of caramel and citrus fruit. The medium roast ensures that the delicate, complex aromas of the Arabica bean are fully preserved and highlighted, resulting in a clean and exceptionally drinkable cup that invites repeated sips.
        \nThis is a versatile coffee that shines whether brewed in a French press, pour-over, or drip machine. It represents the best of Philippine Arabica tradition—a fragrant, sweet, and approachable coffee experience that truly reflects the misty mountain air of its origin.
        """,
        
        // 2. Benguet Arabica - Atok Origin
        """
        Sourced specifically from the high-elevation town of **Atok** in Benguet, this Arabica stands out for its **rich, smooth body** and comforting depth of flavor. The unique climate and volcanic soil in this area contribute to a dense, superior bean quality, celebrated by Philippine coffee aficionados for decades.
        Upon brewing, expect delightful **notes of caramel and dark chocolate**, underpinned by a deep sweetness. The low-key, pleasant acidity ensures the cup finishes clean, leaving a lingering, smooth aftertaste. It strikes a beautiful balance between the approachable smoothness of Arabica and a satisfying depth of roast.
        The *Benguet Arabica* is an excellent choice for a morning espresso or a robust pour-over. Its inherent strength and complexity hold up well to milk and sugar, making it a foundation for superb lattes and cappuccinos while remaining elegant enough to be enjoyed black.
        """,
        
        // 3. Mt. Apo Arabica - Fully Washed
        """
        This is a **premium, specialty-grade Arabica** hailing from the slopes of **Mt. Apo**, the Philippines' highest peak. Grown in the volcanic, fertile soil of Mindanao, these beans are meticulously *fully washed* to produce an exceptionally clean and bright cup, emphasizing the inherent purity of the high-altitude Arabica.
        The taste is immediately recognizable by its **bright acidity**, **floral aromas**, and pronounced **sweet stone fruit flavors** like apricot or peach. This is a complex coffee that rewards thoughtful brewing, revealing layers of tropical nuance and a vibrant mouthfeel that contrasts with heavier Philippine roasts.
        Recommended for lighter brewing methods such as a Chemex or V60 pour-over, where its aromatic complexity and clarity can truly shine. It represents the modern frontier of Philippine specialty coffee, offering a taste experience that rivals the finest single-origins globally.
        """,
        
        // 4. Sultan Kudarat Arabica
        """
        Hailing from the lush, rich farmlands of **Sultan Kudarat**, this Arabica is quickly gaining acclaim for its delightful sweetness and comforting flavor profile. The region’s consistent climate and elevation provide ideal conditions for cultivating a bean that is both mellow and characteristically flavorful.
        The primary characteristics are a **delightful chocolatey and sweet profile**, often likened to rich cocoa powder and brown sugar. It possesses a moderate body and smooth, round mouthfeel, making it incredibly easy to drink and instantly satisfying. It's a sweet indulgence without the need for added flavorings.
        This coffee works wonderfully across many brewing applications, from a simple auto-drip machine to a moka pot. Its inherent sweetness and smooth nature make it a fantastic base for iced coffee preparations or a reliable, comforting brew for any time of the day.
        """,
        
        // 5. Kalinga Robusta - Dark Roast
        """
        The **Kalinga Robusta** is a powerful and assertive coffee, perfectly suited for those who demand strength and intensity in their cup. Grown in the formidable Cordillera region, these beans are purposefully subjected to a **deep, dark roast** to maximize their inherent robustness and caffeine content.
        Expect an **intense, smoky, and bold cup** with a full body and an undeniable earthy pungency. The defining feature of this Robusta is the **high caffeine kick**, making it a traditional favorite for jump-starting a long workday or for use in traditional Filipino *kape* preparation.
        This is not a subtle coffee; it’s a powerhouse. It performs exceptionally well when brewed traditionally, often sweetened, or when used in espresso machines where its strong character and ability to produce excellent *crema* are utilized. A true testament to the strength and resilience of Philippine Robusta.
        """,
        
        // 6. Cavite Robusta - Double Roasted
        """
        Sourced from Cavite, one of the original coffee provinces, this **Double Roasted Robusta** is designed for maximum flavor impact. The process of double roasting draws out deep oils and amplifies the inherent body and earthiness of the Robusta bean, resulting in an exceptionally rich, dark profile.
        The flavor is **bold and earthy**, delivering a significant, heavy body and a sharp, traditional taste that cuts through milk and sugar effortlessly. Unlike lighter roasts, the double roast tames some of the bean's natural bitterness, replacing it with a comforting, bittersweet intensity.
        This is a fantastic option for blending, adding necessary *crema* and body to lighter Arabicas, or for coffee drinkers who specifically prefer the pungent, powerful, and **sharp traditional Filipino taste**. It's best used in methods that handle fine grounds well, such as the *ibrik* or standard drip filters.
        """,
        
        // 7. Ifugao Robusta
        """
        Grown on the challenging, terraced landscapes of Ifugao, this Robusta bean possesses a **powerful, commanding flavor** that reflects the rugged beauty of its origin. The altitude and traditional farming methods contribute to a resilient bean that is dense, potent, and exceptionally aromatic when roasted.
        This variety offers prominent **woody notes** and a deep earthiness, delivering a medium-heavy body that carries a **long, assertive finish**. While intense, it maintains a clean, straightforward taste, making it a reliable and classic example of a high-quality Robusta.
        It serves as an excellent foundation for any coffee preparation requiring a strong flavor base, particularly popular for brewing into a rich, condensed-milk-sweetened cup. If you seek a coffee with unwavering strength and traditional Philippine coffee character, the *Ifugao Robusta* won't disappoint.
        """,
        
        // 8. Batangas Barako (Liberica)
        """
        **Kapeng Barako**, or **Liberica**, from Batangas is a legendary Philippine coffee that stands completely apart from the other major varietals. Revered for its uniquely large, asymmetrical beans and extraordinary flavor profile, it represents a deep slice of Philippine history and culture.
        The taste is intensely complex: **distinctly pungent, smoky, and undeniably strong**. What truly sets it apart is its unique aroma, often described as having hints of **star anise** or an almost **fruity, jackfruit-like** sweetness, which contrasts beautifully with its boldness. It demands attention with a sharp, lingering finish.
        The *Batangas Barako* is a truly singular experience for the adventurous coffee drinker. It is best enjoyed traditionally brewed, allowing the heavy body and rich oil content to fully express themselves. It consistently ranks as one of our most popular products due to its iconic status and unique taste.
        """,
        
        // 9. Lipa Barako - Heritage
        """
        Sourced from **Lipa, Batangas**, the historical heartland of Barako production, this is a **Heritage Liberica** strain, prized for its ancestral lineage and exceptional quality. The generations of expertise in this region ensure a bean that showcases the finest characteristics of the Liberica species.
        This roast is crafted to be a slightly *milder* expression than the darkest Barako, aimed at highlighting the **complex smoky, earthy, and deep floral notes** without being overwhelmingly strong. You'll find a sophisticated interplay between woodiness and a subtle, dark sweetness that defines Lipa's terroir.
        For those who love the distinctive Barako flavor but desire a smoother approach, the *Lipa Barako - Heritage* is the ideal choice. It works beautifully as a slow-brewed afternoon cup, perfect for contemplation and enjoying the depth of this truly unique Philippine variety.
        """,
        
        // 10. Barako House Blend (L+R)
        """
        The **Barako House Blend** is a strategic and popular combination of **Liberica** and high-quality **Robusta** beans. This blend is meticulously balanced to harness the best qualities of both: the Liberica's distinctive pungent aroma and unique flavor, and the Robusta's powerful body and strength.
        The result is a coffee that delivers a **robust, heavy body** with the unmistakable **Barako aroma**. It provides a powerful, satisfying kick without the sometimes overwhelming fruitiness of 100% Liberica, making it highly versatile and broadly appealing.
        This is often the go-to choice for cafes and homes wanting a traditional, strong Filipino coffee experience. It’s excellent when prepared as *kape*, used in espresso, or simply brewed strong to start the day. It offers remarkable value and consistent, intense flavor.
        """,
        
        // 11. Excelsa - Single Origin Cavite
        """
        **Excelsa** is one of the Philippines’ rarest and most fascinating coffee varieties, making up only a small percentage of global production. This Single Origin Excelsa from **Cavite** is a complex and unique offering that sits genetically between Arabica and Liberica, providing an extraordinary profile.
        The flavor is truly enigmatic: expect a combination of **tart, fruity notes** (sometimes likened to a mix of apple and plum), **woodiness**, and a delicate smokiness. This multifaceted profile leads to a long, intriguing aftertaste that keeps the palate guessing.
        For the adventurous coffee connoisseur, *Excelsa* offers an experience unlike any other. Due to its tart, distinct nature, it can be enjoyed black, but also pairs beautifully with sweeteners, which help highlight its sweeter fruit notes. It's a must-try to complete the Philippine 'Big Four' experience.
        """,
        
        // 12. Excelsa-Robusta Blend
        """
        This blend is created to leverage the unique strengths of both **Excelsa** and **Robusta**. The addition of Excelsa's exotic flavor notes to the powerful base of Robusta results in a more aromatic and nuanced strong coffee, elevating a standard intense brew.
        The **Robusta** provides the necessary **strength, body, and *crema***, while the **Excelsa** introduces its signature **fruity and tart complexity**. The resulting cup is deep, full-bodied, highly caffeinated, and notably more flavorful than pure Robusta.
        Due to its rich body and excellent *crema* production, this mixture is particularly **great for espresso** or any method requiring a strong flavor base. It's the perfect middle ground for those seeking strength combined with a subtle layer of exotic, fruity complexity.
        """,
        
        // 13. Pinoy Breakfast Blend
        """
        The **Pinoy Breakfast Blend** is a comforting, time-honored recipe designed to provide a gentle, yet invigorating start to the Filipino morning. It traditionally combines Arabica, Robusta, and a touch of Excelsa to achieve a balance of fragrance, body, and mild kick.
        The flavor profile is **fragrant, balanced, and approachable**, featuring the smooth notes of Arabica, the body of Robusta, and a hint of the unique aroma from Excelsa. It's deliberately crafted to be the quintessential, easy-drinking, comforting morning coffee.
        Priced affordably and designed for mass appeal, this blend is incredibly versatile. It can be brewed in large batches for family gatherings or enjoyed simply, often with a side of *pandesal*. It represents the warmth and simplicity of traditional Filipino coffee culture.
        """,
        
        // 14. Dark Side Blend
        """
        The **Dark Side Blend** is the ultimate choice for the coffee drinker who believes bolder is better. It uses an **ultra-dark roast** of select **Arabica and Robusta** beans, pushing the roast level to the extreme to achieve maximum flavor intensity and minimal perceived acidity.
        This blend delivers **maximum intensity** with deep, bittersweet notes of baker's chocolate, charred wood, and a heavy, syrupy body. The high temperature caramelizes the sugars, lending the coffee a dense sweetness that balances the powerful, robust flavor.
        Best suited for methods that appreciate a dark roast, such as a cold brew extraction or a French press. If you enjoy your coffee with a deep, uncompromising character and a powerful *kape* punch, the *Dark Side Blend* is the rich and enduring choice.
        """,
        
        // 15. Kape Maria Cordillera (Arabica)
        """
        The **Kape Maria Cordillera** represents a specific tribute to the female farmers in the northern mountain region, celebrating the rich heritage of Philippine Arabica. It is carefully processed to be a **fragrant and balanced specialty coffee**, highlighting the best terroir characteristics.
        This medium-roasted Arabica features a profile that is both **delicate and complex**, with a pleasing, gentle aroma and sweet notes of vanilla and spice. It offers a smooth, medium body and a clean acidity that makes it highly enjoyable and easy to appreciate by any coffee drinker.
        This selection is often favored for its accessibility and superior quality. It's an excellent showcase of the potential of high-grown Philippine Arabica and serves well as a reliable, consistently delicious filter coffee or a gentle, aromatic espresso.
        """
    ]
}

