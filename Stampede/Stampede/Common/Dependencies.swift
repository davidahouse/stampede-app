//
//  Dependencies.swift
//  Stampede
//
//  Created by David House on 10/10/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import SwiftUI

protocol Dependencies {
    var defaults: StampedeDefaults { get }
    var service: StampedeService { get }
    var repositoryList: RepositoryList { get }
    var theme: CurrentTheme { get }
}

class BaseDependencies: Dependencies {
    let defaults: StampedeDefaults = {
        return StampedeDefaults()
    }()
    
    let service: StampedeService
    
    let repositoryList: RepositoryList = {
        return BaseRepositoryList()
    }()
    let theme: CurrentTheme

    init(serviceProvider: StampedeServiceProvider? = nil) {
        theme = CurrentTheme()
        if let serviceProvider = serviceProvider {
            service = StampedeService(provider: serviceProvider)
        } else {
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
        }
        defaults.hostSubject = service.hostPassthroughSubject
    }
}

class FixtureDependencies: Dependencies {
    let defaults: StampedeDefaults = {
        return StampedeDefaults()
    }()
    
    let service: StampedeService
    
    let repositoryList: RepositoryList = {
        return RepositoryListFixture()
    }()
    let theme: CurrentTheme

    let fixtureProvider = StampedeServiceFixtureProvider()
    
    init() {
        theme = CurrentTheme()
        service = StampedeService(host: "fixtures", provider: fixtureProvider)
        defaults.hostSubject = service.hostPassthroughSubject
    }
}
