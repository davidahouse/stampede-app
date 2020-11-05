//
//  RepositoryBuildTaskViewModel.swift
//  Stampede-Mobile
//
//  Created by David House on 12/2/19.
//  Copyright © 2019 David House. All rights reserved.
//

import Foundation
import HouseKit
import Combine

class BuildTaskViewModel: BaseViewModel<TaskDetails> {

    enum ArtifactCategory {
        case hasRoute
        case openURL
        case none
    }

    func categoryForArtifact(_ artifact: TaskArtifact) -> ArtifactCategory {
        switch artifact.type {
        case "cloc", "xcodebuild":
            return .hasRoute
        case "link":
            return .openURL
        default:
            return .none
        }
    }
}
