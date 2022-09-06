//
//  StampedeApp.swift
//  Stampede
//
//  Created by David House on 6/17/22.
//  Copyright © 2022 David House. All rights reserved.
//

import SwiftUI

@main
struct StampedeApp: App {

    @StateObject var defaults: StampedeDefaults
    @StateObject var service: StampedeService
    @StateObject var theme: CurrentTheme
    @StateObject var repositoryList: RepositoryList
    
    // MARK: - Initializer

    init() {
        
        if !ProcessInfo.areTestsRunning() && !ProcessInfo.arePreviewsRunning() && !ProcessInfo.isStampedeServerInEnvironment() &&
            !ProcessInfo.isPersonaInEnvironment() {
            
            _defaults = StateObject(wrappedValue: StampedeDefaults.standard)
            _service = StateObject(wrappedValue: StampedeService(host: StampedeDefaults.standard.host, provider: StampedeServiceNetworkProvider(host: StampedeDefaults.standard.host)))
            _theme = StateObject(wrappedValue: CurrentTheme())
            _repositoryList = StateObject(wrappedValue: RepositoryList())
            
        } else {
            
            _defaults = StateObject(wrappedValue: StampedeDefaults.debug)
            _service = StateObject(wrappedValue: StampedeService(host: StampedeDefaults.debug.host, provider: StampedeServiceFixtureProvider(host: StampedeDefaults.debug.host)))
            _theme = StateObject(wrappedValue: CurrentTheme())
            _repositoryList = StateObject(wrappedValue: RepositoryList(repositories: Repository.favoriteRepositories, provider: RepositoryListFixtureProvider()))
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if !ProcessInfo.areTestsRunning() && !ProcessInfo.arePreviewsRunning() {
                NavigationStack {
                    MainView()
                        .environmentObject(theme)
                        .environmentObject(service)
                        .environmentObject(repositoryList)
                }
            } else {
                EmptyView()
            }
        }
    }
}
