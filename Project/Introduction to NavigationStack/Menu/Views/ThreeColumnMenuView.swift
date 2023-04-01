//
//  ThreeColumnMenuView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 07/03/2023.
//

import SwiftUI

struct ThreeColumnMenuView: View {
    
    
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var fetcher: ProductsFetcher
    
    @Binding var columnVisibility: NavigationSplitViewVisibility
    @Binding var showCart: Bool
    @Binding var showSettings: Bool
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility) {
            switch fetcher.action {
            case .loading:
                ProgressView()
            case .finished:
                SideBarView(selectedCategory: $routerManager.selectedCategory)
                    .navigationTitle("Menu")
                    .toolbar {
                        if UIDevice.current.userInterfaceIdiom == .phone {
                            
                            ToolbarItem(placement: .primaryAction) {
                                CartButton(count: cartManager.items.count) {
                                    showCart.toggle()
                                }
                            }
                            
                        }
                    }
            default:
                EmptyView()
            }
        } content: {
            ZStack {
                Group {
                    
                    if let category = routerManager.selectedCategory {
                        
                        let items = fetcher.getItems(in: category) ?? []
            
                        List(items,
                             id: \.id,
                             selection: $routerManager.selectedItemId) { item in
                            let route = routerManager.getRoute(for: item)
                            NavigationLink(item.title, value: route)
                        }
                        .navigationTitle(category.title)
                        
                        
                    } else {
                        Text("Choose a category")
                    }
                    
                }
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
            }


        } detail: {
            
            NavigationStack(path: $routerManager.routes) {
                
                Group {
                    if let selectedItemId = routerManager.selectedItemId,
                       let selectedCategory = routerManager.selectedCategory,
                       let item = fetcher.getItems(in: selectedCategory)?.first(where: { $0.id == selectedItemId }) {
                            getView(for: item)
                    } else {
                        Text("Choose an item")
                    }
                }
                .navigationDestination(for: Route.self) { $0 }
            }
        
        }

    }
}

private extension ThreeColumnMenuView {
    
    @ViewBuilder
    func getView(for item: any MenuItem) -> some View {
        if let food = item as? Food {
            FoodDetailView(food: food)
        } else if let drink = item as? Drink {
            DrinkDetailView(drink: drink)
        } else if let dessert = item as? Dessert {
            DessertDetailView(dessert: dessert)
        } else {
            EmptyView()
        }
    }
}

struct ThreeColumnMenuView_Previews: PreviewProvider {
    
    struct ThreeColumnMenuContainerView: View {
        
        @State private var showCart: Bool = false
        @State private var showSettings: Bool = false

        @StateObject var routerManager = NavigationRouter()
        @StateObject var fetcher = ProductsFetcher()
        @StateObject var cartManager = ShoppingCartManager()
        
        var body: some View {
            ThreeColumnMenuView(columnVisibility: .constant(.automatic),
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
        
        ThreeColumnMenuContainerView()
            .preview(for: .iPhone)
        
        ThreeColumnMenuContainerView()
            .preview(for: .iPad)
    }
}
