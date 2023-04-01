//
//  LocationsDetailView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 06/02/2023.
//

import SwiftUI

struct LocationsDetailView: View {
    
    let locations: [Location]
    
    var body: some View {
        List {
            ForEach(locations, id: \.name) { location in
                NavigationLink(location.name, value: Route.map(location: location))
            }
        }
        .navigationTitle("Locations")
    }
}

struct LocationsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LocationsDetailView(locations: foods[0].locations!)
        }
    }
}
