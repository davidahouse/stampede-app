//
//  ArtifactXcodebuildViewModel.swift
//  Stampede
//
//  Created by David House on 10/24/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class ArtifactXcodebuildViewModel: BaseViewModel<ArtifactXcodebuild> {
    
}

#if DEBUG
extension ArtifactXcodebuildViewModel {
    static let someViewModel = ArtifactXcodebuildViewModel(state: .results(ArtifactXcodebuild.someXcodebuild))
}
#endif
