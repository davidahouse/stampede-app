//
//  BuildKeyCell.swift
//  Stampede
//
//  Created by David House on 9/7/20.
//  Copyright © 2020 David House. All rights reserved.
//

import SwiftUI

struct BuildKeyCell: View {
    let buildKey: BuildKey

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                PrimaryLabel(buildKey.buildKey)
            }
            Spacer()
            ValueLabel(buildKey.startedAgo)
        }
    }

}

struct BuildKeyCell_Previews: PreviewProvider {
    static var previews: some View {
        Previewer {
            BuildKeyCell(buildKey: BuildKey.someBranchKeys[0])
        }
    }
}
