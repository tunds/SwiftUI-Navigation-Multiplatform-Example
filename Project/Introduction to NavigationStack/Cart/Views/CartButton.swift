//
//  CartButton.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 06/02/2023.
//

import SwiftUI

struct CartButton: View {
    
    let count: Int
    let didTap: () -> ()
    
    var body: some View {
        Button {
            didTap()
        } label: {
            Image(systemName: "cart")
                .symbolVariant(.fill)
                .padding(4)
        }
        .overlay(alignment: .topTrailing) {
            if count > 0 {
                badge
            }
        }
    }
}

private extension CartButton {
    
    var badge: some View {
        Text("\(count)")
            .foregroundColor(.white)
            .padding(6)
            .font(.caption2.bold())
            .monospacedDigit()
            .background(
                Circle()
                    .fill(.red)
            )
            .offset(x: 2, y: -2)
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(count: 0) {
            
        }
        .previewLayout(.sizeThatFits)
        .padding()
        
        CartButton(count: 1) {
            
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
