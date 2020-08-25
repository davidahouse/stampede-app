//
//  HistoryTasksFeature.swift
//  Stampede
//
//  Created by David House on 7/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct HistoryTasksFeature: View {
    var body: some View {
        HistoryTasksView()
            .navigationBarTitle("Task History")
    }
}

#if DEBUG
struct HistoryTasksFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            NavigationView {
                HistoryTasksFeature()
            }
        }
    }
}
#endif
