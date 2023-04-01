//
//  MenuGridView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 06/03/2023.
//

import SwiftUI

struct MenuGridView: View {
    
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var cartManager: ShoppingCartManager

    let title: String
    let items: [any MenuItem]

    private var columns: [GridItem] {
        [ GridItem(.adaptive(minimum: 200), spacing: 32) ]
    }
 
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns,
                      spacing: 32) {
                ForEach(items, id: \.id) { item in
                    let route = routerManager.getRoute(for: item)
                    NavigationLink(value: route) {
                        MenuCardView(item: item) { item in
                            cartManager.add(item)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .scenePadding()
        }
        .navigationTitle(title)
        .navigationDestination(for: Route.self) { $0 }
    }
}

struct MenuGridView_Previews: PreviewProvider {
    
    struct MenuGridViewContainer: View {
        
        @StateObject var routerManager = NavigationRouter()
        @StateObject var fetcher = ProductsFetcher()
        @StateObject var cartManager = ShoppingCartManager()

        var body: some View {
            NavigationSplitView {
                SideBarView(selectedCategory: $routerManager.selectedCategory)
                    .navigationTitle("Menu")
            } detail: {
                NavigationStack(path: $routerManager.routes) {
                    if let category = routerManager.selectedCategory {
                        let items = fetcher.getItems(in: category) ?? []
                        MenuGridView(title: category.title,
                                     items: items)
                    }
                }
            }
            .environmentObject(cartManager)
            .environmentObject(routerManager)
            .task {
                await fetcher.fetchProducts()
            }
        }
    }
    
    static var previews: some View {
        MenuGridViewContainer()
            .preview(for: .iPad)
    }
}
