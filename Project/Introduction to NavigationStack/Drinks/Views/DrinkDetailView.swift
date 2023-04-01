//
//  DrinkDetailView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 04/02/2023.
//

import SwiftUI

struct DrinkDetailView: View {
    
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routeManager: NavigationRouter

    let drink: Drink
    
    var body: some View {
        List {
            
            Section {
                LabeledContent("Icon", value: drink.name)
                LabeledContent("Name", value: drink.title)
                LabeledContent {
                    Text(drink.price,
                         format: .currency(code: Locale.current.currency?.identifier ?? ""))
                } label: {
                    Text("Price")
                }
                LabeledContent("Fizzy?", value: drink.isFizzy ? "✅" : "❌")
            }
            
            Section("Description") {
                Text(drink.description)
            }
            
            Section {
                Button {
                    cartManager.add(drink)
                    routeManager.reset()
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .symbolVariant(.fill)
                }
            }

        }
        .listStyle(.insetGrouped)
        .navigationTitle(drink.title)
        .toolbar {
            if let productShareDeepLink = Route.buildDeepLink(from: .menuItem(item: drink)) {
                ToolbarItem(placement: .primaryAction) {
                    ShareLink(item: productShareDeepLink) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DrinkDetailView(drink: drinks[0])
                .environmentObject(ShoppingCartManager())
                .environmentObject(NavigationRouter())
        }
    }
}
