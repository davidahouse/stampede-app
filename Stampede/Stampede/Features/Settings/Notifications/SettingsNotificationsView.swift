//
//  SettingsNotificationsView.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct SettingsNotificationsView: View {
    
    @State var receiveNotifications: Bool = false
    
    var body: some View {
        Form {
            Toggle("Receive Notifications", isOn: $receiveNotifications)
        }
    }
}

#if DEBUG
struct SettingsNotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            SettingsNotificationsView()
        }
    }
}
#endif
