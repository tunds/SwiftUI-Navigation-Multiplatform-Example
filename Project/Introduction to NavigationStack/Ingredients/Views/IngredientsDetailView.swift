//
//  IngredientsDetailView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 06/02/2023.
//

import SwiftUI

struct IngredientsDetailView: View {
    
    let ingredients: [Ingredient]
    
    var body: some View {
        List(ingredients, id: \.name) { ingredient in
            LabeledContent {
                Text(ingredient.quantity / 100, format: .percent)
            } label: {
                Text(ingredient.name)
            }
        }
        .navigationTitle("Ingredients")
    }
}

struct IngredientsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            IngredientsDetailView(ingredients: foods[0].ingredients!)
        }
    }
}
