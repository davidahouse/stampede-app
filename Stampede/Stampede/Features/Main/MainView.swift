//
//  MainView.swift
//  Stampede-Mobile
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//
import SwiftUI
import Combine
import HouseKit

struct MainView: View {

    // MARK: - Environment

    @EnvironmentObject var theme: CurrentTheme
    @StateObject var viewModel = MainViewModel()
    @EnvironmentObject var service: StampedeService
    @EnvironmentObject var repositoryList: RepositoryList

    // MARK: - View

    var body: some View {
        List {
            Section(header: SectionHeaderLabel("Repositories")) {
                ForEach(repositoryList.repositories, id: \.self) { item in
                    NavigationLink(value: item, label: {
                        RepositoryCell(repository: item)
                    }).accessibilityIdentifier(item.id)
                }
            }
            Section(header: SectionHeaderLabel("Monitor")) {
                ForEach(MainMenuItem.monitorItems, id: \.self) { item in
                    NavigationLink(value: item, label: {
                        FeatureRouteCell(title: item.rawValue)
                    })
                }
            }
            Section(header: SectionHeaderLabel("History")) {
                ForEach(MainMenuItem.historyItems, id: \.self) { item in
                    NavigationLink(value: item, label: {
                        FeatureRouteCell(title: item.rawValue)
                    })
                }
            }
            Section(header: SectionHeaderLabel("Settings")) {
                ForEach(MainMenuItem.settingsItems, id: \.self) { item in
                    NavigationLink(value: item, label: {
                        FeatureRouteCell(title: item.rawValue)
                    })
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Stampede")
        .withNavigationDestinations()
    }
}

#if DEBUG

struct MainView_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<MainViewModel>] {
        [
            PreviewData(id: "someResults", viewModel: MainViewModel.defaultViewModel),
            PreviewData(id: "empty", viewModel: MainViewModel.empty),
            PreviewData(id: "loading", viewModel: MainViewModel.loading),
            PreviewData(id: "networkError", viewModel: MainViewModel.networkError)
        ]
    }

    static func create(from viewModel: MainViewModel) -> some View {
        return MainView().environmentObject(viewModel)
    }
}
#endif
