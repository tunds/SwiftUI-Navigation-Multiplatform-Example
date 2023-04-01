//
//  MenuView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 03/02/2023.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var fetcher: ProductsFetcher
    
    @State private var showCart: Bool = false
    @State private var showSettings: Bool = false
    @State private var showAllColumns: Bool = true
    @State private var columVisibility: NavigationSplitViewVisibility = .automatic

    @Binding var layoutExperience: LayoutExperienceSetting?
    
    var body: some View {
        
        Group {
            
            switch layoutExperience {
        
            case .threeColumn:
                ThreeColumnMenuView(columnVisibility: $columVisibility,
                                    showCart: $showCart,
                                    showSettings: $showSettings)
            default:
                TwoColumnMenuView(columnVisibility: $columVisibility,
                                  showCart: $showCart,
                                  showSettings: $showSettings)
            }
        }
        .sheet(isPresented: $showCart) {
            NavigationStack {
                CartView()
                    .environmentObject(cartManager)
            }
            .presentationDetents([.medium])
        }
        .sheet(isPresented: $showSettings) {
            NavigationStack {
                SettingsView(layoutExperience: $layoutExperience)
            }
        }
        .task {
            await fetcher.fetchProducts()
        }
        .background {
            Button("") {
                showAllColumns.toggle()
            }
            .keyboardShortcut("h", modifiers: .control)
            .onChange(of: showAllColumns) { newValue in
                columVisibility = showAllColumns ? .all : .detailOnly
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    struct MenuContainerView: View {
        
        @AppStorage("layoutExperience")
        var layoutExperience: LayoutExperienceSetting?
        
        var body: some View {
            MenuView(layoutExperience: $layoutExperience)
                .environmentObject(ShoppingCartManager())
                .environmentObject(NavigationRouter())
                .environmentObject(ProductsFetcher())
        }
    }
    
    static var previews: some View {
        MenuContainerView()
            .preview(for: .iPhone)
        
        MenuContainerView()
            .preview(for: .iPad)
    }
}
