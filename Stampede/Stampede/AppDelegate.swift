//
//  AppDelegate.swift
//  Stampede-Mobile
//
//  Created by David House on 10/11/19.
//  Copyright © 2019 David House. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
//
//    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
//        // Get URL components from the incoming user activity.
//        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
//            let incomingURL = userActivity.webpageURL,
//            let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true) else {
//            return false
//        }
//
//        // Check for specific URL components that you need.
//        guard let path = components.path,
//        let params = components.queryItems else {
//            return false
//        }
//        print("path = \(path)")
//        print("params = \(params)")
//        return false
//    }
//
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        // Determine who sent the URL.
//            let sendingAppID = options[.sourceApplication]
//            print("source application = \(sendingAppID ?? "Unknown")")
//
//            // Process the URL.
//            guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
//                let path = components.path,
//                let params = components.queryItems else {
//                    print("Invalid URL or album path missing")
//                    return false
//            }
//
//        print("path = \(path)")
//        print("params = \(params)")
//        return true
//    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
