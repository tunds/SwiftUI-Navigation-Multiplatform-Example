//
//  LayoutExperienceView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 04/03/2023.
//

import SwiftUI

struct LayoutExperienceView: View {
    
    @Binding var selectedLayoutExperience: LayoutExperienceSetting?
    
    var columns: [GridItem] {
        [
         GridItem(.flexible(), spacing: 10),
         GridItem(.flexible(), spacing: 10)
        ]
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 24) {
            Text("Layout Configuration")
                .font(.title)
                .bold()
                        
            LazyVGrid(columns: columns) {
                ForEach(LayoutExperienceSetting.allCases) { item in
                    Button {
                        selectedLayoutExperience = item
                    } label: {
                        LayoutExperienceSelectionView(selectedItem: $selectedLayoutExperience,
                                                      item: item)
                    }
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.thinMaterial)
        }
        .scenePadding()
    }
}

struct LayoutExperienceSelectionView: View {
    
    @State private var isHovering = false
    @Binding var selectedItem: LayoutExperienceSetting?
    
    let item: LayoutExperienceSetting
    
    var body: some View {
        VStack {
            Image(systemName: item.imageName)
                .font(.largeTitle)
                .foregroundStyle(shapeStyle(Color.accentColor))
            VStack {
                Text(item.title)
                    .bold()
                    .foregroundStyle(shapeStyle(Color.primary))
                Text(item.description)
                    .lineLimit(3, reservesSpace: true)
                    .font(.callout)
                    .foregroundStyle(shapeStyle(Color.secondary))
            }
            .padding(.top, 16)
        }
        .padding(24)
        .background {
            RoundedRectangle(cornerRadius: 12,
                             style: .continuous)
            .fill(selectedItem == item ? AnyShapeStyle(Color.accentColor) : AnyShapeStyle(.background))
            .shadow(radius: selectedItem == item ? 4 : 0)
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(isHovering ? Color.accentColor : .clear)
        }
        .scaleEffect(isHovering ? 1.02 : 1)
        .onHover { isHovering in
            withAnimation {
                self.isHovering = isHovering
            }
        }
    }
    
    func shapeStyle<S: ShapeStyle>(_ style: S) -> some ShapeStyle {
        if selectedItem == item {
            return AnyShapeStyle(.background)
        } else {
            return AnyShapeStyle(style)
        }
    }
}

struct LayoutExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutExperienceView(selectedLayoutExperience: .constant(.twoColumn))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
