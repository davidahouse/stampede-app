//
//  ErrorBuildDetails.swift
//  Stampede
//
//  Created by David House on 10/21/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import HouseKit

class ErrorBuildDetailsPersona: HappyPersona {

    override var buildDetails: FixtureResponse<BuildStatus> {
        .error(.network(description: "some network error happened"))
    }
}
