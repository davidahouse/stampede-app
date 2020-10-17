//
//  SceneDelegate.swift
//  Stampede-Mobile
//
//  Created by David House on 10/11/19.
//  Copyright © 2019 David House. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainFeature: MainFeature?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let userActivity = connectionOptions.userActivities.first,
               userActivity.activityType == NSUserActivityTypeBrowsingWeb,
               let incomingURL = userActivity.webpageURL,
               let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true) {
           
            // Handle this link!
            
            // Check for specific URL components that you need.
           guard let path = components.path,
               let params = components.queryItems else {
               return
           }
           print("scene path = \(path)")
           print("scene params = \(params)")
            return
        }
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            if !areTestsRunning() && !arePreviewsRunning() {
                
                let dependencies: Dependencies = {
                    if let stampedeServer = ProcessInfo.processInfo.environment["StampedeServer"], stampedeServer == "fixtures" {
                        return Dependencies(repositoryList: RepositoryListFixture())
                    } else {
                        return Dependencies()
                    }
                }()

                mainFeature = MainFeature(dependencies: dependencies)
                let rootNavVC = MainNavigationController(rootViewController: mainFeature!)
                window.rootViewController = rootNavVC
            } else {
                window.rootViewController = UIViewController()
            }
            self.window = window
            window.makeKeyAndVisible()
        }

    }
    
    /**
     This method is called if the app is already running and we want to deep link into it.
     */
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let first = URLContexts.first, let route = Route.fromURL(first.url) {
            mainFeature?.push(route: route)
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    private func areTestsRunning() -> Bool {
        return NSClassFromString("XCTest") != nil
    }

    private func arePreviewsRunning() -> Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil
    }
}
