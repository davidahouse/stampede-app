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
    @EnvironmentObject var viewModel: MainViewModel
    @EnvironmentObject var router: Router
    @EnvironmentObject var routes: Routes

    // MARK: - View

    var body: some View {
        List {
            Section(header: SectionHeaderLabel("Repositories")) {
                BaseView(viewModel: viewModel, content: { repositories in
                    ForEach(repositories, id: \.self) { item in
                        Button(action: {
                            self.router.route(to: routes.route(for: item))
                        }, label: {
                            RepositoryCell(repository: item)
                        }).accessibilityIdentifier(item.id)
                    }
                })
            }
            Section(header: SectionHeaderLabel("Monitor")) {
                ForEach(MainMenuItem.monitorItems, id: \.self) { item in
                    FeatureRouteCell(title: item.rawValue, route: routes.route(for: item))
                }
            }
            Section(header: SectionHeaderLabel("History")) {
                ForEach(MainMenuItem.historyItems, id: \.self) { item in
                    FeatureRouteCell(title: item.rawValue, route: routes.route(for: item))
                }
            }
            Section(header: SectionHeaderLabel("Settings")) {
                ForEach(MainMenuItem.settingsItems, id: \.self) { item in
                    FeatureRouteCell(title: item.rawValue, route: routes.route(for: item))
                }
            }
        }.listStyle(GroupedListStyle())
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
