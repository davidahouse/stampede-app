//
//  RepositoryCell.swift
//  Stampede
//
//  Created by David House on 8/30/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct RepositoryCell: View {

    let repository: Repository

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                PrimaryLabel(repository.owner)
                SecondaryLabel(repository.repository)
            }
            Spacer()
        }.accessibility(identifier: repository.id)
    }
}

#if DEBUG
struct RepositoryCell_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<Repository>] {
        [
            PreviewData(id: "someRepository", viewModel: Repository.someRepository)
        ]
    }

    static func create(from viewModel: Repository) -> some View {
        return RepositoryCell(repository: viewModel)
    }
}
#endif
