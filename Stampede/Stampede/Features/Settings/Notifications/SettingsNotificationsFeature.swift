//
//  SettingsNotificationFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsNotificationsFeature: View {
    var body: some View {
        SettingsNotificationsView()
            .navigationBarTitle("Notifications")
    }
}

struct SettingsNotificationFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                SettingsNotificationsFeature()
            }
        }
    }
}
