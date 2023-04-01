//
//  MenuItemView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 03/02/2023.
//

import SwiftUI

struct MenuItemView: View {
    
    let item: any MenuItem
    
    var body: some View {
        LabeledContent {
            Text(item.price,
                 format: .currency(code: Locale.current.currency?.identifier ?? ""))
        } label: {
            Text("\(item.name) \(item.title)")
        }
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: foods[0])
            .previewLayout(.sizeThatFits)
    }
}
