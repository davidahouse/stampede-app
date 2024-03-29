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

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                PrimaryLabel(buildKey.buildKey)
            }
            Spacer()
            ValueLabel(buildKey.startedAgo)
            Image(systemName: "chevron.right")
        }
    }

}

#if DEBUG
struct BuildKeyCell_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<(Repository, BuildKey)>] {
        [
            PreviewData(id: "someRepository", viewModel: (Repository.someRepository, BuildKey.someBranchKeys[0]))
        ]
    }

    static func create(from viewModel: (Repository, BuildKey)) -> some View {
        return BuildKeyCell(repository: viewModel.0, buildKey: viewModel.1)
    }
}
#endif
