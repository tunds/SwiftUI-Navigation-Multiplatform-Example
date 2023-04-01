//
//  SideBarView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 05/03/2023.
//

import SwiftUI

struct SideBarView: View {
    
    @Binding var selectedCategory: MenuCategory?
    
    var body: some View {
        List(MenuCategory.allCases,
             selection: $selectedCategory) { category in
            NavigationLink(value: category) {
                Label(category.title, systemImage: category.systemImage)
            }
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitView {
            SideBarView(selectedCategory: .constant(.food))
        } detail: {
            Text("Some Content Here")
        }
        .preview(for: .iPhone)
        
        NavigationSplitView {
            SideBarView(selectedCategory: .constant(.drink))
        } detail: {
            Text("Some Content Here")
        }
        .preview(for: .iPad)
    }
}
