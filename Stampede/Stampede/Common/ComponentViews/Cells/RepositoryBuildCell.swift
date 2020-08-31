//
//  RepositoryBuildCell.swift
//  Stampede
//
//  Created by David House on 8/31/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct RepositoryBuildCell: View {
    
    let repositoryBuild: RepositoryBuild
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                PrimaryLabel(repositoryBuild.build)
            }
            Spacer()
            ValueLabel(repositoryBuild.completedAgo)
        }
    }
}

#if DEBUG
struct RepositoryBuildCell_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            RepositoryBuildCell(repositoryBuild: RepositoryBuild.someBuild)
        }
    }
}
#endif
