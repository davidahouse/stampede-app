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

    @EnvironmentObject var router: Router

    var body: some View {
        Button(action: {
            router.route(to: .repositoryBuildDetails(repository, build: repositoryBuild.build))
        }, label: {
            HStack {
                VStack(alignment: .leading) {
                    PrimaryLabel(repositoryBuild.build)
                }
                Spacer()
                ValueLabel(repositoryBuild.completedAgo)
                Image(systemName: "chevron.right")
            }
        })
    }
}

#if DEBUG
struct RepositoryBuildCell_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            RepositoryBuildCell(repository: Repository.someRepository,
                                repositoryBuild: RepositoryBuild.someBuild)
        }
    }
}
#endif
