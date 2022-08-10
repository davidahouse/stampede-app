//
//  FavoriteRepositoryCell.swift
//  Stampede
//
//  Created by David House on 10/12/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct FavoriteRepositoryCell: View {
    let repository: Repository

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                PrimaryLabel(repository.owner)
                SecondaryLabel(repository.repository)
            }
            Spacer()
            Image(systemName: "star.fill").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }.accessibility(identifier: repository.id)
    }
}

#if DEBUG
struct FavoriteRepositoryCell_Previews: PreviewProvider, Previewable {

    static var viewModels: [PreviewData<Repository>] {
        [
            PreviewData(id: "someRepository", viewModel: Repository.someRepository)
        ]
    }

    static func create(from viewModel: Repository) -> some View {
        return FavoriteRepositoryCell(repository: viewModel)
    }
}
#endif
