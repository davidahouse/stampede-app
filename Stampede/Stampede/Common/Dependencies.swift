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
    let theme: CurrentTheme
    let repositoryList: RepositoryList

    init(serviceProvider: StampedeServiceProvider? = nil, repositoryList: RepositoryList = BaseRepositoryList()) {
        theme = CurrentTheme()
        self.repositoryList = repositoryList
        if let serviceProvider = serviceProvider {
            service = StampedeService(provider: serviceProvider)
        } else {
            #if DEBUG
            if let stampedeServer = ProcessInfo.processInfo.environment["StampedeServer"] {
                if stampedeServer == "fixtures" {
                    if let persona = ProcessInfo.processInfo.environment["Persona"] {
                        service = StampedeService(host: stampedeServer, provider: StampedeServiceFixtureProvider(host: "fixtures", persona: StampedeServiceFixtureProvider.fromString(persona)))
                    } else {
                        service = StampedeService(host: stampedeServer, provider: StampedeServiceFixtureProvider(host: "fixtures"))
                    }
                } else {
                    service = StampedeService(host: stampedeServer, provider: StampedeServiceNetworkProvider(host: stampedeServer))
                }
            } else {
                service = StampedeService(host: defaults.host, provider: StampedeServiceNetworkProvider(host: defaults.host))
            }
            #else
            service = StampedeService(host: defaults.host, provider: StampedeServiceNetworkProvider(host: defaults.host))
            #endif
        }
        defaults.hostSubject = service.hostPassthroughSubject
    }

    func selectNetworkProvider() {
        service.provider = StampedeServiceNetworkProvider(host: defaults.host)
    }

    func selectFixturePersona(_ persona: String) {
        service.provider = StampedeServiceFixtureProvider(host: "fixtures", persona: StampedeServiceFixtureProvider.fromString(persona))
    }
}
