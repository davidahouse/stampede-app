//
//  RepositoryView.swift
//  Stampede-Mobile
//
//  Created by David House on 10/13/19.
//  Copyright © 2019 David House. All rights reserved.
//

import SwiftUI

struct RepositoryView: View {

    // MARK: - Environment

//    @EnvironmentObject var router: Router

    // MARK: - Properties
    let repository: Repository

    let activeBuilds: [BuildStatus] = BuildStatus.activeBuilds

    // MARK: - Observed objects

    @ObservedObject var viewModel: RepositoryViewModel

    // MARK: - View

    var body: some View {
        List {
            Section(header: Text("Active Builds")) {
                ForEach(activeBuilds, id: \.self) { item in
                    NavigationLink(destination: BuildFeature(buildStatus: item)) {
                        StandardCell(viewModel: item.toStandardCellViewModel())
                    }
                }
            }

            Section(header: Text("Repository Builds")) {
                HStack {
                    Text("Manual Build")
                    Spacer()
                    Text("3 day(s) ago")
                }
            }

            Section(header: Text("Branches")) {
                HStack {
                    Text("development")
                    Spacer()
                    Text("5 minute(s) ago")
                }
                HStack {
                    Text("releases/v5.42")
                    Spacer()
                    Text("4 day(s) ago")
                }
            }

            Section(header: Text("Releases")) {
                HStack {
                    Text("v5.41")
                    Spacer()
                    Text("4 day(s) ago")
                }
                HStack {
                    Text("v5.40")
                    Spacer()
                    Text("14 day(s) ago")
                }
                HStack {
                    Text("v5.39")
                    Spacer()
                    Text("21 day(s) ago")
                }
            }

            Section(header: Text("Pull Requests")) {
                HStack {
                    Text("pullrequest-61")
                    Spacer()
                    Text("3 minute(s) ago")
                }
                HStack {
                    Text("pullrequest-60")
                    Spacer()
                    Text("12 minute(s) ago")
                }
                HStack {
                    Text("pullrequest-44")
                    Spacer()
                    Text("15 minute(s) ago")
                }
            }
        }
            .navigationBarTitle(repository.repository)
    }
    
    func buildsSection() -> AnyView {
        return AnyView(Text("hello"))
//        switch viewModel.builds {
//        case .empty(let message):
//            return AnyView(Text(message))
//        case .networkError:
//            return AnyView(NetworkErrorView())
//        case .hasResults(let results):
//            return AnyView(
//                       ForEach(results, id: \.self) { item in
//                           StandardCell(viewModel: item.toStandardCellViewModel())
//                       }
//                       )
//        }
    }
    
    func recentSection() -> AnyView {
        return AnyView(Text("hello"))
//        switch viewModel.recent {
//        case .empty(let message):
//            return AnyView(Text(message))
//        case .networkError:
//            return AnyView(NetworkErrorView())
//        case .hasResults(let results):
//            return AnyView(
//                       ForEach(results, id: \.self) { item in
//                           StandardCell(viewModel: item.toStandardCellViewModel())
//                       }
//                       )
//        }
    }
}

#if DEBUG
struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            RepositoryView(repository: Repository.someRepository,
                       viewModel:
                        RepositoryViewModel())
//            RepositoryView(repository: Repository.someRepository,
//                       viewModel:
//                RepositoryViewModel.someViewModel)
//            RepositoryView(repository: Repository.someRepository,
//                       viewModel:
//                RepositoryViewModel.someViewModelOnlyBuilds)
//            RepositoryView(repository: Repository.someRepository,
//                       viewModel:
//                RepositoryViewModel.someViewModelOnlyRecents)
//
        }
    }
}
#endif
