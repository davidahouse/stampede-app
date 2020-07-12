//
//  MainFeature.swift
//  Stampede-Mobile
//
//  Created by David House on 12/1/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MainFeature: View {

    // MARK: - Initializer
    init() {
    }

    // MARK: - View

    var body: some View {
        MainView()
    }
}

#if DEBUG
struct MainFeature_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreviewer {
            MainFeature()
        }
    }
}
#endif
