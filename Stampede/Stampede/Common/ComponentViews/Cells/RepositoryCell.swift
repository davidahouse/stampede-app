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
        }
    }
}

#if DEBUG
struct RepositoryCell_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            RepositoryCell(repository: Repository.someRepository)
        }
    }
}
#endif
