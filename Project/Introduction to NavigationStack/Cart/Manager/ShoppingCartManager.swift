//
//  ShoppingCartManager.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 06/02/2023.
//

import Foundation

struct CartItem: Identifiable, Hashable {
    let id: String
    let title: String
    let name: String
    let price: Decimal
    
    init(_ item: any MenuItem) {
        self.id = "\(item.name)_\(item.title)"
        self.title = item.title
        self.name = item.name
        self.price = item.price
    }
}

final class ShoppingCartManager: ObservableObject {
    
    @Published private(set) var items: [CartItem] = []
    @Published private(set) var promo: PromoData?
    
    func add(_ item: any MenuItem) {
        items.append(CartItem(item))
    }
    
    func remove(id: String) {
        items.removeAll(where: { $0.id == id })
    }
    
    func getGroupedCart() -> [CartItem: Int] {
        var itemCounts = [CartItem: Int]()
        for item in items {
            itemCounts[item, default: 0] += 1
        }
        return itemCounts
    }
    
    func getTotal() -> Decimal {
        let total = items.reduce(0) { $0 + $1.price }
        guard let discount = promo?.pct else { return total }
        return total - (discount * total)
    }
    
    func set(promo: PromoData) {
        self.promo = promo
    }
    
    func removePromo() {
        self.promo = nil
    }
}
