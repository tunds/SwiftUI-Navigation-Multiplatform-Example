//
//  LayoutExperienceSetting.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 04/03/2023.
//

import Foundation

enum LayoutExperienceSetting: Int, Identifiable, CaseIterable, Equatable {
    
    var id: Int { rawValue }
    
    case twoColumn
    case threeColumn
    
    var imageName: String {
        switch self {
        case .twoColumn:
            return "sidebar.left"
        case .threeColumn:
            return "rectangle.split.3x1"
        }
    }
    
    var title: String {
        switch self {
        case .twoColumn:
            return "Two columns"
        case .threeColumn:
            return "Three columns"
        }
    }
    
    var description: String {
        switch self {
        case .twoColumn:
            return "Presents views in two columns: sidebar and detail."
        case .threeColumn:
            return "Presents views in three columns: sidebar, content, and detail."
        }
    }
}
