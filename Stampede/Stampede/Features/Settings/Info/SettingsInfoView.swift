//
//  SettingsInfoView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsInfoView: View {

    // MARK: - Environment Objects

    @EnvironmentObject var theme: CurrentTheme

    // MARK: - Observed Objects

    @EnvironmentObject var viewModel: SettingsInfoViewModel
    @EnvironmentObject var debugInfo: DebugInfo

    var body: some View {
        List {
            Text("Version: \(viewModel.appVersion)")
            Text("Build: \(viewModel.appBuildNumber)")
            Button("https://stampedeci.com", action: {
                UIApplication.shared.open(URL(string: "https://stampedeci.com")!, options: [:]) { _ in

                }
            })
            ForEach(debugInfo.messages, id: \.self) { message in
                Text(message)
            }
            if SceneDelegate.didReceiveUserActivities {
                Text("Scene Delegate received user activities")
            }
            if SceneDelegate.didReceiveURLContexts {
                Text("Scene Delegate received URL contexts")
            }
            if SceneDelegate.didFailToHandleURLContexts {
                Text("Scene Delegate failed to handle URL contexts")
            }
            if AppDelegate.didReceiveLaunchOptions {
                Text("App Delegate received launch options")
            }
            if AppDelegate.didReceiveContinueUserActivity {
                Text("App Delegate received continue user activity")
            }
        }
        .listStyle(DefaultListStyle())
    }
}

struct SettingsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsInfoView().environmentObject(SettingsInfoViewModel())
    }
}
