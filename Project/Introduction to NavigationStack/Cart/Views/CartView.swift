//
//  CartView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 06/02/2023.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routeManager: NavigationRouter
    
    var body: some View {
        List {
            let items = cartManager.getGroupedCart()
            ForEach(items.keys.sorted(by: { $0.title < $1.title })) { key in
                let count = items[key]!
                LabeledContent {
                    let price = key.price * Decimal(count)
                    Text(price,
                         format: .currency(code: Locale.current.currency?.identifier ?? ""))
                } label: {
                    let multiplierVw = Text("x\(count)").font(.footnote).bold()
                    Text("\(multiplierVw) \(key.name) \(key.title)")
                }
                .swipeActions {
                    Button(role: .destructive) {
                        cartManager.remove(id: key.id)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
            
            if let promo = cartManager.promo {
                
                Section {
                    
                    LabeledContent {
                        if let pct = promo.pct {
                            Text(pct, format: .percent)
                        } else {
                            Text("N/A")
                        }
                    } label: {
                        Text(promo.desc)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            cartManager.removePromo()
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            
            Section {
                LabeledContent {
                    Text(cartManager.getTotal(),
                         format: .currency(code: Locale.current.currency?.identifier ?? ""))
                    .bold()
                } label: {
                    Text("Total")
                }
            }
        }
        .navigationTitle("Basket")
    }
}

struct CartView_Previews: PreviewProvider {
    
    static var previews: some View {
        let manager = ShoppingCartManager()
        NavigationStack {
            CartView()
                .environmentObject(manager)
                .onAppear {
                    manager.set(promo: .init(desc: "Great promo",
                                             pct: 0.5))
                    for food in foods {
                        manager.add(food)
                    }
                }
        }
    }
}
