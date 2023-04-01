//
//  Introduction_to_NavigationStackApp.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 03/02/2023.
//

import SwiftUI
import UserNotifications
import FirebaseCore
import FirebaseMessaging

class MyAppDelegate: NSObject, UIApplicationDelegate, ObservableObject, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    var app: Introduction_to_NavigationStackApp?
    
    @objc
    func toggleColumnVisibility() {
        
         
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
     
        FirebaseApp.configure()

        FirebaseConfiguration.shared.setLoggerLevel(.debug)
        
        Messaging.messaging().delegate = self
        
        UNUserNotificationCenter.current().delegate = self
        
        application.registerForRemoteNotifications()
        
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        if let deepLink = response.notification.request.content.userInfo["link"] as? String,
           let url = URL(string: deepLink) {
            Task {
                await app?.handleDeeplinking(from: url)
            }
            print("✅ found deep link \(deepLink)")
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.sound, .badge, .banner, .list]
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {

        #if DEBUG
        print("🚨 FCM Token: \(fcmToken)")
        #endif
    }
        
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
}

@main
struct Introduction_to_NavigationStackApp: App {
    
    @StateObject private var routerManager = NavigationRouter()
    @StateObject private var cartManager = ShoppingCartManager()
    @StateObject private var fetcher = ProductsFetcher()
    
    @UIApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
    
    @AppStorage("layoutExperience")
    var layoutExperience: LayoutExperienceSetting?
    
    var body: some Scene {
        WindowGroup {
            TabView {
                Group {
                    MenuView(layoutExperience: $layoutExperience)
                        .tabItem {
                            Label("Menu", systemImage: "menucard")
                        }
                        .environmentObject(cartManager)
                        .environmentObject(routerManager)
                        .environmentObject(fetcher)
                        .onOpenURL { url in
                            Task {
                                await handleDeeplinking(from: url)
                            }
                        }

                    SettingsView(layoutExperience: $layoutExperience)
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
                }
                .toolbar(UIDevice.current.userInterfaceIdiom != .phone ? .hidden : .visible, for: .tabBar)
            }
            .onAppear {
                appDelegate.app = self
            }
        }
    }
}

private extension Introduction_to_NavigationStackApp {
    
    func handleDeeplinking(from url: URL) async {
        
        let routeFinder = RouteFinder()
        if let route = await routeFinder.find(from: url,
                                              productsFetcher: fetcher) {
            switch route {
            case .menuItem(let item, _):
                routerManager.selectedCategory = fetcher.getCategory(for: item)
                routerManager.selectedItemId = item.id
                if layoutExperience != .threeColumn {
                    routerManager.push(to: route)
                }
            default:
                routerManager.selectedCategory = MenuCategory.allCases.first
                routerManager.push(to: route)
            }
        }
    }
}
