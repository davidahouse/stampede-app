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
            Group {
                if SceneDelegate.didReceiveUserActivities {
                    Text("Scene Delegate received user activities")
                }
                if SceneDelegate.didReceiveURLContexts {
                    Text("Scene Delegate received URL contexts")
                }
                if SceneDelegate.didFailToHandleURLContexts {
                    Text("Scene Delegate failed to handle URL contexts")
                }
                if SceneDelegate.didReceiveBrowsingWebActivityType {
                    Text("Scene Delegate received browsing web activity type")
                }
                if SceneDelegate.didReceiveUnknownActivityType {
                    Text("Scene Delegate received unknown activity type")
                }
                Text("Deep Link Path: " + SceneDelegate.deepLinkPath)
            }
        }
        .listStyle(DefaultListStyle())
    }
}

struct SettingsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsInfoView().environmentObject(SettingsInfoViewModel())
        }
    }
}
