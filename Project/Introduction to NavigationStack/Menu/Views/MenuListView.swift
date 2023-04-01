//
//  MenuListView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 06/03/2023.
//

import SwiftUI

struct MenuListView: View {
    
    @EnvironmentObject private var routerManager: NavigationRouter

    let title: String
    let items: [any MenuItem]
    
    var body: some View {
        List(items, id: \.id) { item in
            let route = routerManager.getRoute(for: item)
            NavigationLink(value: route) {
                MenuItemView(item: item)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(for: Route.self) { $0 }
    }
}

struct MenuListView_Previews: PreviewProvider {
    
    struct MenuListViewContainer: View {
        
        @StateObject var routerManager = NavigationRouter()
        @StateObject var fetcher = ProductsFetcher()

        var body: some View {
            NavigationSplitView {
                SideBarView(selectedCategory: $routerManager.selectedCategory)
                    .navigationTitle("Menu")
            } detail: {
                NavigationStack(path: $routerManager.routes) {
                    if let category = routerManager.selectedCategory {
                        let items = fetcher.getItems(in: category) ?? []
                        MenuListView(title: category.title,
                                     items: items)
                    }
                }
            }
            .environmentObject(routerManager)
            .task {
                await fetcher.fetchProducts()
            }
        }
    }
    
    static var previews: some View {
        MenuListViewContainer()
            .preview(for: .iPhone)
    }
}
