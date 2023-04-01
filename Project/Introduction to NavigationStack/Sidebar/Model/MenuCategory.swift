//
//  MenuCategory.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 05/03/2023.
//

import Foundation

enum MenuCategory: Int, CaseIterable, Identifiable {
    
    var id: Int { rawValue }

    case food
    case dessert
    case drink
}

extension MenuCategory {
    
    var title: String {
        switch self {
        case .food:
            return "Food"
        case .dessert:
            return "Desserts"
        case .drink:
            return "Drinks"
        }
    }
    
    var systemImage: String {
        switch self {
        case .food:
            return "fork.knife"
        case .dessert:
            return "birthday.cake"
        case .drink:
            return "mug"
        }
    }
}
