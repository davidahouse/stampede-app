//
//  MonitorActiveBuildsView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/3/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI
import StampedeCommon

struct MonitorActiveBuildsView: View {

    // MARK: - Environment

    // MARK: - Observed Objects

//    @ObservedObject var viewModel: BaseListViewModel<BuildStatus>

    // MARK: - View

    var body: some View {
//        StandardList(viewModel.state)
//            .navigationBarTitle("Active Builds")
        Text("hello")
    }
}

#if DEBUG
struct MonitorActiveBuildsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorActiveBuildsView()
        }
    }
}
#endif
