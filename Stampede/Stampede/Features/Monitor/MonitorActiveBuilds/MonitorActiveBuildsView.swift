//
//  MonitorActiveBuildsView.swift
//  Stampede-Mobile
//
//  Created by David House on 12/3/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct MonitorActiveBuildsView: View {

    // MARK: - Environment

    // MARK: - Observed Objects

//    @ObservedObject var viewModel: BaseListViewModel<BuildStatus>

    // MARK: - View

    let activeBuilds: [BuildStatus] = BuildStatus.activeBuilds

    var body: some View {
        List {
            ForEach(activeBuilds, id: \.self) { item in
                NavigationLink(destination: BuildFeature(buildStatus: item)) {
                    StandardCell(viewModel: item.toStandardCellViewModel())
                }
            }
        }
    }}

#if DEBUG
struct MonitorActiveBuildsView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            MonitorActiveBuildsView()
        }
    }
}
#endif
