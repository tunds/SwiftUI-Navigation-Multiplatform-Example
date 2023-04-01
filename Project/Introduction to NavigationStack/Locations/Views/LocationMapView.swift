//
//  LocationMapView.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 06/02/2023.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    
    @EnvironmentObject private var routeManager: NavigationRouter
    let location: Location
    
    var body: some View {
        Map(coordinateRegion: .constant(.init(center: .init(latitude: location.lat,
                                                            longitude: location.long),
                                              latitudinalMeters: 100,
                                              longitudinalMeters: 100)),
            annotationItems: [location]) { item in
            MapMarker(coordinate: .init(latitude: location.lat,
                                        longitude: location.long))
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .toolbar(.hidden, for: .tabBar)
            .toolbar(.hidden, for: .navigationBar)
            .overlay(alignment: .bottom) {
                HStack {
                    
                    Group {
                        Button("Back to Menu") {
                            routeManager.reset()
                        }

                        Button("Back to Locations") {
                            routeManager.goBack()
                        }

                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                }
            }
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LocationMapView(location: foods[2].locations![0])
                .environmentObject(NavigationRouter())
        }
    }
}
