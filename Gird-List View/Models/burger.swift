import UIKit
struct burger {
    let name: String
    let image: UIImage
}
var burgers : [burger] = [burger(name: "Big mac", image: UIImage(named: "bigmac")!),
                          burger(name: "Hamburger", image: UIImage(named: "ham")!),
                           burger(name: "Zinger", image: UIImage(named: "zinger")!),
                            burger(name: "Mighty Zinger", image: UIImage(named: "mighty")!),
                             burger(name: "Double Cheese", image: UIImage(named: "double")!)

]
