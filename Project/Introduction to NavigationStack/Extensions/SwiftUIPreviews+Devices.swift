//
//  SwiftUIPreviews+Devices.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 05/03/2023.
//

import SwiftUI

struct DevicePreviewModifier: ViewModifier {
    
    enum Device {
        case iPhone
        case iPad
    }
    
    let device: Device
    
    func body(content: Content) -> some View {
        switch device {
        case .iPad:
            content
                .previewDevice("iPad (10th generation)")
                .previewDisplayName("iPad Preview")
                .previewInterfaceOrientation(.landscapeLeft)
        case .iPhone:
            content
                .previewDevice("iPhone 14")
                .previewDisplayName("iPhone Preview")
        }
    }
}

extension View {
    
    func preview(for device: DevicePreviewModifier.Device) -> some View {
        self.modifier(DevicePreviewModifier(device: device))
    }
}
