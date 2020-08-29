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

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            if !areTestsRunning() && !arePreviewsRunning() {
                let defaults: StampedeDefaults = {
                    return StampedeDefaults()
                }()

                let service: StampedeService = {
                    if let stampedeServer = ProcessInfo.processInfo.environment["StampedeServer"] {
                        if stampedeServer == "fixtures" {
                            return StampedeService(host: stampedeServer, provider: StampedeServiceNetworkProvider(host: "http://localhost:8845"))
// TODO: Fix this once we have a fixtures service                            return StampedeServiceFixtures.mockService
                        } else {
                            return StampedeService(host: stampedeServer, provider: StampedeServiceNetworkProvider(host: stampedeServer))
                        }
                    } else {
                        return StampedeService(host: defaults.host, provider: StampedeServiceNetworkProvider(host: defaults.host))
                    }
                }()
                defaults.hostSubject = service.hostPassthroughSubject

                let theme = CurrentTheme()

                window.rootViewController = UIHostingController(rootView: MainFeature()
                    .environmentObject(service)
                    .environmentObject(defaults)
                    .environmentObject(theme)
                )
            }
            self.window = window
            window.makeKeyAndVisible()
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
