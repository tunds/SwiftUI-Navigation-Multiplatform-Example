//
//  NotificationsManager.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 11/02/2023.
//

import Foundation
import UserNotifications
import UIKit

@MainActor
class NotificationsManager: ObservableObject {
    
    @Published private(set) var hasPermission = false
    
    init() {
        Task {
            await getAuthStatus()
        }
    }
    
    func request() async {
        
        do {
            hasPermission = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
            if hasPermission {
                UIApplication.shared.registerForRemoteNotifications()
            }
        } catch {
            print(error)
        }
    }
    
    func getAuthStatus() async {
        let status = await UNUserNotificationCenter.current().notificationSettings()
        switch status.authorizationStatus {
            
        case .authorized,
             .provisional,
             .ephemeral:
            hasPermission = true
        default:
            hasPermission = false
        }
    }
}
