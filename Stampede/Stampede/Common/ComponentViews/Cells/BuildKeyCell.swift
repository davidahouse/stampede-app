//
//  BuildKeyCell.swift
//  Stampede
//
//  Created by David House on 9/7/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct BuildKeyCell: View {
    let repository: Repository
    let buildKey: BuildKey

    @EnvironmentObject var router: Router
    @EnvironmentObject var routes: Routes

    var body: some View {
        Button(action: {
            router.route(to: routes.routeForRepositorySourceDetails(repository, buildKey: buildKey.buildKey))
        }, label: {
            HStack {
                VStack(alignment: .leading) {
                    PrimaryLabel(buildKey.buildKey)
                }
                Spacer()
                ValueLabel(buildKey.startedAgo)
                Image(systemName: "chevron.right")
            }
        })
    }

}

#if DEBUG
struct BuildKeyCell_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        BuildKeyCell_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<(Repository, BuildKey)> {
        PreviewData(id: "someRepository", viewModel: (Repository.someRepository, BuildKey.someBranchKeys[0]))
    }

    static var alternateViewModels: [PreviewData<(Repository, BuildKey)>] {
        []
    }

    static func create(from viewModel: (Repository, BuildKey)) -> some View {
        return BuildKeyCell(repository: viewModel.0, buildKey: viewModel.1)
    }
}
#endif
