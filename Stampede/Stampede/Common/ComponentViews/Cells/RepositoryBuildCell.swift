//
//  RepositoryBuildCell.swift
//  Stampede
//
//  Created by David House on 8/31/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct RepositoryBuildCell: View {

    let repository: Repository
    let repositoryBuild: RepositoryBuild

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                PrimaryLabel(repositoryBuild.build)
            }
            Spacer()
            ValueLabel(repositoryBuild.completedAgo)
            Image(systemName: "chevron.right")
        }
    }
}

#if DEBUG
struct RepositoryBuildCell_Previews: PreviewProvider, Previewable {
    static var previews: some View {
        RepositoryBuildCell_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<(Repository, RepositoryBuild)> {
        PreviewData(id: "someRepository", viewModel: (Repository.someRepository, RepositoryBuild.someBuild))
    }

    static var alternateViewModels: [PreviewData<(Repository, RepositoryBuild)>] {
        [
        ]
    }

    static func create(from viewModel: (Repository, RepositoryBuild)) -> some View {
        return RepositoryBuildCell(repository: viewModel.0, repositoryBuild: viewModel.1)
    }
}
#endif
