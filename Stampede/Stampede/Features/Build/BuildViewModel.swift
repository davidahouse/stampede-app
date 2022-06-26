//
//  RepositoryBuildViewModel.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import SwiftUI
import HouseKit
import Combine

class BuildViewModel: BaseViewModel<BuildStatus> {

    let buildID: String
    
    init(buildID: String, initialState: ViewModelState<BuildStatus>? = nil) {
        self.buildID = buildID
        if let initialState {
            super.init(state: initialState)
        } else {
            super.init()
        }
    }
    
    var statusImage: some View {
        switch state {
        case .results(let buildStatus):
            switch buildStatus.statusIndicator {
            case .inProgress:
                return CurrentTheme.Icons.inProgress.image()
            case .failure:
                return CurrentTheme.Icons.failure.image()
            case .success:
                return CurrentTheme.Icons.success.image()
            }
        default:
            return CurrentTheme.Icons.warningStatus.image()
        }
    }
    
    func fetch(service: StampedeService) async {
        state = await service.fetchBuildDetails(buildID: buildID)
    }
}
