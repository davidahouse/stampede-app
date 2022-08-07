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

@MainActor
class BuildTaskViewModel: BaseViewModel<TaskDetails> {

    enum ArtifactCategory {
        case hasRoute
        case openURL
        case none
        case installplist
    }

    let taskID: String

    init(taskID: String, state: ViewModelState<TaskDetails> = .loading, publisher: AnyPublisher<TaskDetails, ServiceError>? = nil) {
        self.taskID = taskID
        super.init(state: state, publisher: publisher)
    }

    func categoryForArtifact(_ artifact: TaskArtifact) -> ArtifactCategory {
        switch artifact.type {
        case "link":
            return .openURL
        case "installplist":
            return .installplist
        default:
            return .none
        }
    }

    func appInstallURL(_ artifact: TaskArtifact) -> URL? {
        switch artifact.type {
        case "installplist":
            if let urlString = artifact.url,
               let encodedUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
               let installUrl = URL(string: "itms-services://?action=download-manifest&url=" + encodedUrl) {
                return installUrl
            } else {
                return nil
            }
        default:
            return nil
        }
    }
    
    public func fetch(service: StampedeService) async {
        state = await service.fetchTaskDetails(taskID: taskID)
    }
}
