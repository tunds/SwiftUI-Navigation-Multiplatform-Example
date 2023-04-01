//
//  TwoColumnMenuView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 06/03/2023.
//

import SwiftUI

struct TwoColumnMenuView: View {
    
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var fetcher: ProductsFetcher
    
    @Binding var columnVisibility: NavigationSplitViewVisibility
    @Binding var showCart: Bool
    @Binding var showSettings: Bool

    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility) {

            Group {
                switch fetcher.action {
                case .loading:
                    ProgressView()
                case .finished:
                    SideBarView(selectedCategory: $routerManager.selectedCategory)
                default:
                    EmptyView()
                }
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    CartButton(count: cartManager.items.count) {
                        showCart.toggle()
                    }
                }
                
                if UIDevice.current.userInterfaceIdiom != .phone {
                    ToolbarItem {
                        Button {
                            showSettings.toggle()
                        } label: {
                            Image(systemName: "gear")
                        }
                    }
                }
            }
        } detail: {
            if let category = routerManager.selectedCategory {
                
                let items = fetcher.getItems(in: category) ?? []
                
                NavigationStack(path: $routerManager.routes) {
                    switch UIDevice.current.userInterfaceIdiom {
                    case .phone:
                        MenuListView(title: category.title,
                                     items: items)
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                                CartButton(count: cartManager.items.count) {
                                    showCart.toggle()
                                }
                            }
                        }
                    default:
                        MenuGridView(title: category.title,
                                     items: items)
                    }
                }
            } else {
                Text("Choose a category")
            }
        }
    }
}

struct TwoColumnMenuView_Previews: PreviewProvider {
    
    struct TwoColumnMenuContainerView: View {
        
        @State private var showCart: Bool = false
        @State private var showSettings: Bool = false

        @StateObject var routerManager = NavigationRouter()
        @StateObject var fetcher = ProductsFetcher()
        @StateObject var cartManager = ShoppingCartManager()

        var body: some View {
            TwoColumnMenuView(columnVisibility: .constant(.automatic),
                              showCart: $showCart,
                              showSettings: $showSettings)
            .environmentObject(routerManager)
            .environmentObject(fetcher)
            .environmentObject(cartManager)
            .task {
                await fetcher.fetchProducts()
            }
        }
    }
    
    static var previews: some View {
        TwoColumnMenuContainerView()
            .preview(for: .iPhone)
        
        TwoColumnMenuContainerView()
            .preview(for: .iPad)
    }
}
