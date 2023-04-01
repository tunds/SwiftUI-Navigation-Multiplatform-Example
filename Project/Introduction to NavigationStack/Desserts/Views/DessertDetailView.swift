//
//  DessertDetailView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 04/02/2023.
//

import SwiftUI

struct DessertDetailView: View {
    
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routeManager: NavigationRouter

    let dessert: Dessert
    
    var body: some View {
        List {
            
            Section {
                LabeledContent("Icon", value: dessert.name)
                LabeledContent("Name", value: dessert.title)
                LabeledContent {
                    Text(dessert.price,
                         format: .currency(code: Locale.current.currency?.identifier ?? ""))
                } label: {
                    Text("Price")
                }
                LabeledContent("Cold?", value: dessert.isCold ? "✅" : "❌")
            }
            
            Section("Description") {
                Text(dessert.description)
            }
            
            Section {
                Button {
                    cartManager.add(dessert)
                    routeManager.reset()
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .symbolVariant(.fill)
                }
            }

        }
        .listStyle(.insetGrouped)
        .navigationTitle(dessert.title)
        .toolbar {
            if let productShareDeepLink = Route.buildDeepLink(from: .menuItem(item: dessert)) {
                ToolbarItem(placement: .primaryAction) {
                    ShareLink(item: productShareDeepLink) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            
            DessertDetailView(dessert: desserts[0])
                .environmentObject(ShoppingCartManager())
                .environmentObject(NavigationRouter())
        }
    }
}
