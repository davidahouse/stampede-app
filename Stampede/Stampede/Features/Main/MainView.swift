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

    // MARK: - View

    var body: some View {
        NavigationStack {
            List {
                Section(header: SectionHeaderLabel("Repositories")) {
                    switch viewModel.state {
                    case .loading:
                        PrimaryLabel("Loading...")
                    case .networkError(let error):
                        NetworkErrorView(error: error)
                    case .results(let repositories):
                        ForEach(repositories, id: \.self) { item in
                            NavigationLink(value: item, label: {
                                RepositoryCell(repository: item)
                            }).accessibilityIdentifier(item.id)
                        }
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
                        //                  FeatureRouteCell(title: item.rawValue, route: routes.route(for: item))
                        Text("\(item.rawValue)")
                    }
                }
                Section(header: SectionHeaderLabel("Settings")) {
                    ForEach(MainMenuItem.settingsItems, id: \.self) { item in
                        //                 FeatureRouteCell(title: item.rawValue, route: routes.route(for: item))
                        Text("\(item.rawValue)")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Stampede")
            .navigationDestination(for: Repository.self, destination: { repository in
                RepositoryView(repository: repository)
            })
            .navigationDestination(for: MainMenuItem.self, destination: { menuItem in
                switch menuItem {
                case .activeBuilds:
                    MonitorActiveBuildsView()
                default:
                    EmptyView()
                }
            })
        }
        .task {
            await viewModel.fetch(service: service)
        }
    }
}

#if DEBUG

struct MainView_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        MainView_Previews.devicePreviews
    }

    static var defaultViewModel: PreviewData<MainViewModel> {
        PreviewData(id: "someResults", viewModel: MainViewModel.defaultViewModel)
    }

    static var alternateViewModels: [PreviewData<MainViewModel>] {
        [
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
