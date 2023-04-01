//
//  InvalidProductView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 11/02/2023.
//

import SwiftUI

struct InvalidProductView: View {
    var body: some View {
        VStack {
            Text("😱")
                .font(.system(size: 100))
            Text("Invalid Product")
                .font(.largeTitle)
                .bold()
            Text("Looks like that item doesn't exist anymore")
        }
    }
}

struct InvalidProductView_Previews: PreviewProvider {
    static var previews: some View {
        InvalidProductView()
    }
}
