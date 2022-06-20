//
//  Route.swift
//  Stampede
//
//  Created by David House on 10/11/20.
//  Copyright © 2020 David House. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

enum RouteMethod {
    case push
    case present
}

protocol Route {
    func makeFeature(_ dependencies: Dependencies) -> UIViewController
}
