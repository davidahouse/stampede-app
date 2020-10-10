//
//  Dependencies.swift
//  Stampede
//
//  Created by David House on 10/10/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

class Dependencies {
    let defaults: StampedeDefaults = {
        return StampedeDefaults()
    }()
    
    let service: StampedeService
    
    let repositoryList: RepositoryList = {
        #if DEBUG
        if let stampedeServer = ProcessInfo.processInfo.environment["StampedeServer"], stampedeServer == "fixtures" {
                return RepositoryList(repositories: [Repository.someRepository])
        }
        #endif
        return RepositoryList()
    }()
    let theme: CurrentTheme

    init() {
        theme = CurrentTheme()
        #if DEBUG
        if let stampedeServer = ProcessInfo.processInfo.environment["StampedeServer"] {
            if stampedeServer == "fixtures" {
                service = StampedeService(host: stampedeServer, provider: StampedeServiceFixtureProvider())
            } else {
                service = StampedeService(host: stampedeServer, provider: StampedeServiceNetworkProvider(host: stampedeServer))
            }
        } else {
            service = StampedeService(host: defaults.host, provider: StampedeServiceNetworkProvider(host: defaults.host))
        }
        #else
        service = StampedeService(host: defaults.host, provider: StampedeServiceNetworkProvider(host: defaults.host))
        #endif
        defaults.hostSubject = service.hostPassthroughSubject
    }
}
