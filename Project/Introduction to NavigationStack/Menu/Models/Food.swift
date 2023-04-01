//
//  Food.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 03/02/2023.
//

import Foundation
import CoreLocation

protocol MenuItem: Identifiable, Hashable {
    var id: String { get }
    var name: String { get }
    var title: String { get }
    var description: String { get }
    var price: Decimal { get }
    var ingredients: [Ingredient]? { get }
    var allergies: [Allergie]? { get }
    var locations: [Location]? { get }
}

struct Food: MenuItem {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let price: Decimal
    let ingredients: [Ingredient]?
    let allergies: [Allergie]?
    let locations: [Location]?
}

let foods: [Food] = [
    Food(name: "🌯",
         title: "Burrito",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 7.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: [
            Allergie(name: "Allergie 1"),
            Allergie(name: "Allergie 2"),
            Allergie(name: "Allergie 3")
         ],
         locations: [
            Location(name: "Location 1",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 2",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 3",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 4",
                     long: -0.1275, lat: 51.507222)
         ]),
    Food(name: "🍜",
         title: "Ramen",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 10.99,
         ingredients: [
            Ingredient(name: "Ingredient 2", quantity: 20),
            Ingredient(name: "Ingredient 3", quantity: 11),
            Ingredient(name: "Ingredient 4", quantity: 15)
         ],
         allergies: nil,
         locations: [
            Location(name: "Location 1",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 2",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 3",
                     long: -0.1275, lat: 51.507222)
         ]),
    Food(name: "🍔",
         title: "Burger",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 4.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: nil,
         locations: [
            Location(name: "Location 1",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 2",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 3",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 4",
                     long: -0.1275, lat: 51.507222)
         ]),
    Food(name: "🍕",
         title: "Pizza",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 1.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: [
            Allergie(name: "Allergie 1"),
            Allergie(name: "Allergie 2"),
            Allergie(name: "Allergie 3")
         ],
         locations: [
            Location(name: "Location 1",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 2",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 3",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 4",
                     long: -0.1275, lat: 51.507222)
         ]),
    Food(name: "🌭",
         title: "Hotdog",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 0.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: nil,
         locations: [
            Location(name: "Location 1",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 2",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 3",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 4",
                     long: -0.1275, lat: 51.507222)
         ]),
    Food(name: "🧆",
         title: "Falafel",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 2.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: [
            Allergie(name: "Allergie 1"),
            Allergie(name: "Allergie 2"),
            Allergie(name: "Allergie 3")
         ],
         locations: [
            Location(name: "Location 1",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 2",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 3",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 4",
                     long: -0.1275, lat: 51.507222)
         ]),
    Food(name: "🍝",
         title: "Spag Bol",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 12.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: nil,
         locations: [
            Location(name: "Location 1",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 2",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 3",
                     long: -0.1275, lat: 51.507222),
            Location(name: "Location 4",
                     long: -0.1275, lat: 51.507222)
         ])
]

struct Drink: MenuItem {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let isFizzy: Bool
    let price: Decimal
    let ingredients: [Ingredient]?
    let allergies: [Allergie]?
    let locations: [Location]?
}

let drinks: [Drink] = [
    Drink(name: "🥤",
          title: "Soda",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: true,
          price: 2.99,
          ingredients: [
             Ingredient(name: "Ingredient 1", quantity: 10),
             Ingredient(name: "Ingredient 2", quantity: 5),
             Ingredient(name: "Ingredient 3", quantity: 5)
          ],
          allergies: nil,
          locations: [
             Location(name: "Location 1",
                      long: -0.1275, lat: 51.507222),
             Location(name: "Location 2",
                      long: -0.1275, lat: 51.507222),
             Location(name: "Location 3",
                      long: -0.1275, lat: 51.507222),
             Location(name: "Location 4",
                      long: -0.1275, lat: 51.507222)
          ]),
    Drink(name: "🧋",
          title: "Boba Tea",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: false,
          price: 3.99,
          ingredients: [
             Ingredient(name: "Ingredient 1", quantity: 10),
             Ingredient(name: "Ingredient 2", quantity: 5),
             Ingredient(name: "Ingredient 3", quantity: 5)
          ],
          allergies: [
             Allergie(name: "Allergie 1"),
             Allergie(name: "Allergie 2"),
             Allergie(name: "Allergie 3")
          ],
          locations: [
             Location(name: "Location 1",
                      long: -0.1275, lat: 51.507222),
             Location(name: "Location 2",
                      long: -0.1275, lat: 51.507222),
             Location(name: "Location 3",
                      long: -0.1275, lat: 51.507222),
             Location(name: "Location 4",
                      long: -0.1275, lat: 51.507222)
          ]),
    Drink(name: "🧃",
          title: "Juice",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: false,
          price: 0.99,
          ingredients: [
             Ingredient(name: "Ingredient 1", quantity: 10),
             Ingredient(name: "Ingredient 2", quantity: 5),
             Ingredient(name: "Ingredient 3", quantity: 5)
          ],
          allergies: nil,
          locations: [
             Location(name: "Location 1",
                      long: -0.1275, lat: 51.507222),
             Location(name: "Location 2",
                      long: -0.1275, lat: 51.507222),
             Location(name: "Location 3",
                      long: -0.1275, lat: 51.507222),
             Location(name: "Location 4",
                      long: -0.1275, lat: 51.507222)
          ])
]

struct Dessert: MenuItem {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let isCold: Bool
    let price: Decimal
    let ingredients: [Ingredient]?
    let allergies: [Allergie]?
    let locations: [Location]?
}

let desserts: [Dessert] = [
    
    Dessert(name: "🍦",
            title: "Ice Cream",
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            isCold: true,
            price: 0.99,
            ingredients: [
               Ingredient(name: "Ingredient 1", quantity: 10),
               Ingredient(name: "Ingredient 2", quantity: 5),
               Ingredient(name: "Ingredient 3", quantity: 5)
            ],
            allergies: [
               Allergie(name: "Allergie 1"),
               Allergie(name: "Allergie 2"),
               Allergie(name: "Allergie 3")
            ],
            locations: [
               Location(name: "Location 1",
                        long: -0.1275, lat: 51.507222),
               Location(name: "Location 2",
                        long: -0.1275, lat: 51.507222),
               Location(name: "Location 3",
                        long: -0.1275, lat: 51.507222),
               Location(name: "Location 4",
                        long: -0.1275, lat: 51.507222)
            ]),
    Dessert(name: "🍩",
            title: "Doughnut",
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            isCold: false,
            price: 0.99,
            ingredients: [
               Ingredient(name: "Ingredient 1", quantity: 10),
               Ingredient(name: "Ingredient 2", quantity: 5),
               Ingredient(name: "Ingredient 3", quantity: 5)
            ],
            allergies: [
               Allergie(name: "Allergie 1"),
               Allergie(name: "Allergie 2"),
               Allergie(name: "Allergie 3")
            ],
            locations: [
               Location(name: "Location 1",
                        long: -0.1275, lat: 51.507222),
               Location(name: "Location 2",
                        long: -0.1275, lat: 51.507222),
               Location(name: "Location 3",
                        long: -0.1275, lat: 51.507222),
               Location(name: "Location 4",
                        long: -0.1275, lat: 51.507222)
            ])
]

struct Ingredient: Hashable {
    let name: String
    let quantity: Double
}

struct Allergie: Hashable {
    let name: String
}

struct Location: Identifiable, Hashable {
    var id: String { name }
    let name: String
    let long: Double
    let lat: Double
}


struct MenuSection {
    let name: String
    let items: [any MenuItem]
}
