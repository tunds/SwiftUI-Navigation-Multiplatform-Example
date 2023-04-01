//
//  MenuCardView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 01/03/2023.
//

import SwiftUI

struct MenuCardView: View {
    
    let item: any MenuItem
    let didTapAdd: (_ item: any MenuItem) -> Void
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(.system(size: 100))
                .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .overlay(alignment: .bottom) {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.system(.headline,
                                      design: .rounded,
                                      weight: .bold))
                    Text(item.price,
                         format: .currency(code: Locale.current.currency?.identifier ?? ""))
                    .font(.caption)
                }
                Spacer()
                Button("Add") {
                    didTapAdd(item)
                }
                .controlSize(.small)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
            .padding(8)
            .background(.ultraThinMaterial)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 3)
        
    }
}

struct MenuCardView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCardView(item: desserts[1]) { _ in
            
        }
            .padding()
            .background(.blue)
            .previewLayout(.sizeThatFits)
    }
}
