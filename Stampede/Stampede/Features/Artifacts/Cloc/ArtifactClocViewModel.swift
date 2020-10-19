//
//  ArtifactClocViewModel.swift
//  Stampede
//
//  Created by David House on 10/18/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class ArtifactClocViewModel: BaseViewModel<ArtifactCloc> { }

#if DEBUG
extension ArtifactClocViewModel {
    static let someCloc = ArtifactClocViewModel(state: .results(ArtifactCloc.someCloc))
}
#endif
